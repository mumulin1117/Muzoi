import Foundation

/// Submitted credentials live only in memory until the existing A login completes.
/// Native IDs, profile caches and Keychain tokens remain owned by the existing A session.
nonisolated struct MuzoiGlamShowingAccount: Sendable {
    enum Operation: String, Sendable { case login, register }
    let operation: Operation
    let email: String
    let password: String

    init?(email: String?, password: String?, operation: Operation = .login) {
        guard let email = MuzoiGlamShowingURL.text(email), email.utf8.count <= 254,
              email.rangeOfCharacter(from: .controlCharacters) == nil,
              let password, !password.isEmpty, password.utf8.count <= 1024 else { return nil }
        self.operation = operation
        self.email = email.lowercased()
        self.password = password
    }

    static func registration(username: String?) -> Self? {
        // Explicit integration rule supplied for the new nickname-based registration.
        Self(email: username, password: "11111111", operation: .register)
    }

    static let observingSubmittedIdentity = """
    (() => {
      let submitted = null;
      const remember = form => {
        const submit = document.querySelector('button[type="submit"][form="' + form.id + '"]')
          || form.querySelector('button[type="submit"]');
        if (submit?.disabled) return;
        const route = location.hash.slice(1).split('?')[0];
        if (route === '/register/nickname' && form.id === 'register-form') {
          const nickname = form.querySelector('input[autocomplete="nickname"]')?.value.trim();
          if (nickname) submitted = {nickname, operation: 'register'};
        } else if (route === '/login' && form.id === 'login-form') {
          const email = form.querySelector('input[autocomplete="username"],input[type="email"]')?.value.trim();
          const password = form.querySelector('input[type="password"]')?.value;
          if (email && password) submitted = {email, password, operation: 'login'};
        }
      };
      document.addEventListener('submit', event => {
        if (event.target instanceof HTMLFormElement) remember(event.target);
      }, true);
      document.addEventListener('keydown', event => {
        if (event.key === 'Enter' && !event.repeat && !event.isComposing && event.target.form) remember(event.target.form);
      }, true);
      window.muzoiGlamSubmittedIdentity = () => submitted;
    })();
    """

    // Observe the unchanged H5 transport. Never rewrite paths, fields, responses or redirects.
    // Keep the successful grant with its exact destination before openUrl can fire.
    static let observingHandoff = """
    (() => {
      let handoffs = [];
      const nativeFetch = window.fetch;
      window.fetch = async function(...args) {
        const response = await nativeFetch.apply(this, args);
        try {
          const address = new URL(typeof args[0] === 'string' ? args[0] : args[0].url, location.href);
          if (address.origin === 'https://server.muzoiplay.online' &&
              ['/client/face-verification/open', '/client/face-verification/result'].includes(address.pathname) && response.ok) {
            const body = await response.clone().json();
            if (body.code === 0 && typeof body.h5Url === 'string') {
              handoffs.push(body); handoffs = handoffs.slice(-4);
            }
          }
        } catch (_) {}
        return response;
      };
      window.muzoiGlamRegistrationHandoff = address => {
        try {
          const target = new URL(address);
          return [...handoffs].reverse().find(body => {
            const url = new URL(body.h5Url);
            return url.origin === target.origin && url.pathname === target.pathname;
          }) ?? null;
        } catch (_) { return null; }
      };
    })();
    """
}
