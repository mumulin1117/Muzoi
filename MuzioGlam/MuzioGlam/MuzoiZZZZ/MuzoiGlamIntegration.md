# Muzoi 启动与登录接入

## 页面职责

- Welcome、Community：始终加载 Open 或 H5 交接返回的 HTTPS URL，不打包本地副本，加载失败也不回退本地 HTML。
- New_login_dist：项目新接入的认证组件，放在 `MuzoiZZZZ/New_login_dist`。Welcome Continue 后及退出登录时，直接打开这一组件；不需要另一张已部署登录网页的地址。
- 不使用 `MuzoiGlamWeb` 目录或 `MuzoiGlamRegistrationURL` 配置。
- 原 A 主 Tab、API、Keychain 会话和个人资料存储继续沿用现有实现。

## 实现文件

- `MuzoiGlamShowingContract.swift`：Open 请求、响应校验、1.5 秒串行重试、页面/按钮消息契约、认证组件入口与身份参数、B 消息字段及验单契约。
- `MuzoiGlamShowingCoordinator.swift`：可取消分发、前后台生命周期、Welcome → New_login_dist、Community → 原 A 登录/注册 → 原主 Tab、各入口退出。
- `MuzoiGlamShowingWeb.swift`：可信主文档消息、首次绘制、远程失败重载、仅认证组件允许的 file 加载、键盘避让、权限提示、App 内浏览器。
- `MuzoiGlamShowingAccount.swift`：内存关联实际提交的邮箱/密码或注册用户名，观察认证组件实际 Open/result 返回的配置，不改写 SDK 请求。
- `MuzoiGlamShowingRealtime.swift`：Ably TokenRequest 兑换、实际 capability 校验、唯一订阅频道、握手、消息去重、重连及取消。
- `MuzoiGlamShowingPurchases.swift`：独立 B 订单落盘、Apple 交易归属、验单、未完成订单恢复。
- `MuzoiGlamLoadingOverlay.swift`、`MuzoiGlamPaletteIndicator.swift`：页面加载和重试使用原生彩妆面板，购买等待使用 A 包原生转圈。
- `New_login_dist/`：完整认证产物，保留 `index.html`、`assets/`、`config/` 相对目录；不附带 Welcome/Community。

现有原生改动集中在 `AppDelegate.swift`（启动/退出/生命周期）、`CContourAccentbakingPuffom.swift`（登录及注册写入前检查任务有效性）与工程资源引用。`Info.plist` 无需增加登录网页地址。用户对工程版本号的修改保留。

## 主链路

1. 每次冷启动 POST `https://server.muzoiplay.online/lustre2/transform/circle`，App ID `48934308`，使用实际版本及原项目持久化设备号，不提交邮箱密码；已有推送 token 才带入。
2. code=0 且有效 HTTPS h5Url 才停止 Open 重试；错误、断网或缺少地址时，本次请求结束后等待 1.5 秒再请求。切换流程使旧 generation 失效，后台无页面时取消请求，恢复后重试。
3. `Muzostart.html` / `MuzoiWelcome.html` 优先走 Welcome。`MuzoiWelcome` 的 `{action:"Sure"或"continue",source:"MuzoiWelcome"}` 直接打开随包 `New_login_dist/index.html`，注入实际 appId、版本、设备号、语言及可选推送 token。
4. `MuzoiGlamCommunityRules.html` / `MuzoiCommunityRules.html` 优先走 Community。`MuzoiCommunityRules` 的 `{action:"Sure"或"Iknow",source:"MuzoiCommunity"}` 才触发原 A 登录或注册，然后进入原 UIKit 主 Tab。
5. 登录分支沿用用户真实输入的邮箱密码；新注册分支按用户确认的规则，用注册用户名作为邮箱、`11111111` 作为密码调用原 A 注册接口。保存接口实际返回的用户 ID 和 Keychain 会话，不制造本地替代 ID，不覆盖为固定测试账号。
6. 认证组件的 `openUrl` 仍按相同规则分发。优先使用与返回地址文档匹配的实际 Open/result 配置；缺失时用提交账号查询一次 Open，且只接受同文档配置。
7. 各处退出登录均回到同一个 New_login_dist 首页。A 包只退出当前登录状态，保留用户资料；B 网页会话独立清理。过期登录/注册响应在落盘前丢弃。

冷启动直接返回 Community 且原 A 会话仍有效时可在确认后恢复；新认证交接缺少真实账号关联时不能误用上一个账号。

## Welcome 与手势

开屏 EULA 弹窗、资格勾选、同意读写和 Continue 拦截已按用户要求移除。原生兼容仍部署旧 HTML 的 Welcome：展示前关闭并移除旧弹窗，Continue 使用既有消息桥，不伪造同意记录。社区规则确认独立保留。

Welcome/Community 的滚动限制只作用于各自页面，不注入认证表单或普通 B 页面。认证容器监听键盘显示、隐藏及位置变化，调整 WebView 底部；登录/昵称表单在高度不超过 420px 时采用紧凑布局，保留可滚动正文和 44px 按钮。正常尺寸和认证 SDK 流程保持原样。

## 加载与过渡

启动 Open、远程 H5 和认证组件交接共用原生彩妆面板。眼影刷依次轻蘸四格眼影，对应粉体泛起珠光，镜面扫光与轻微悬浮体现材质和深度。

首次加载直接复用 LaunchScreen 的 `MuzoiLaunchBackground` 图片及相同 aspect-fill 方式，不重复绘制 Logo；Open 重试和 H5 加载连续使用同一遮罩，不清空背景或重启动画。后续页面切换先保留当前画面，加载层添加在现有 UIWindow 上方。截图仅用于内存中过渡，不写入磁盘。

B 内购等待和验单期间使用 A 包的系统转圈，拦截 WebView 的点击、滚动与网页跳转。遮罩限于 WebView 容器，Apple 系统支付界面可正常操作。结果使用原生提示面板和状态图标，显示 2.5 秒后自动消失。用户取消支付时直接恢复网页交互。

加载超过 180ms 才淡入面板，短请求不闪现动画。H5 可见正文及首帧就绪后，面板已显示至少 440ms、页面稳定等待至少 200ms，再以 300ms 淡出；新加载会取消过期的淡出任务。WebKit 在检查首帧时为字体准备预留最多 800ms，并等待两次 requestAnimationFrame。Welcome/Community 仅隐藏重复的按钮小转圈，不改文案、布局、消息或认证表单的手势。

面板通过 Safe Area 和相对约束布局；短屏或横向紧凑区域缩小眼影盘并居中。进入后台、移除遮罩时停止动画，支持系统“减少动态效果”。原生 A 主界面使用交叉淡入，退出时保留原页面画面，避免重新闪回启动背景。原 A 页面的内容骨架和按钮内局部状态保持原样。

## B 与验单

只有后端有效配置及授权才创建业务连接。缺少 roomId/webSocketUrl 时，签名字段原样提交 Ably 标准 requestToken 端点，从兑换后实际 capability 中选择唯一具体可订阅频道，不猜通配符或元频道。CONNECTED → ATTACH → 对应频道 ATTACHED 后处理业务消息；停止、后台和换页取消 socket、心跳及计时器。

- `lacquer=pay`：`data.sandalwoodGraphite` 是 Apple 商品 ID，`data.patinaOrganza` 是服务端订单号。
- `lacquer=linkSuccessMessage`：读取 `url`；Welcome/Community 仍保留各自确认流程，同一地址不重复跳转。
- `lacquer=logout`：回 New_login_dist。
- `lacquer=openBrowser`：读取 `data.titanium`，在 App 内 Safari 打开；退出业务页关闭旧浏览器。

验单 POST `https://mua.muzoi.top/yalovy/verify`，字段 `gardeniaS`（Apple transactionId）、`houettePatina`（收据 base64）、`velvet`（对应 `data.patinaOrganza` 中的服务端订单号）。按用户确认，只有 HTTP 200 + 空 JSON 对象 `{}` 才记录成功并完成对应 Apple 交易；禁止重定向，其他状态或正文不发放。失败保留原订单恢复，不再下单；不把旧订单回调给新页面或其他账号。

保留原项目实际桥名 `biomechanicalMakeupRenderer`、`kineticMakeupAnimation`、`holographicStyleArchive`、`refractiveBeautyJournal`。旧购买字符串没有服务端订单，不凭空补订单或直接调用成功函数。

## 安全与验证

邮箱密码不写入 URL、日志、UserDefaults 或自制用户 ID。file:// 只允许读取 App Bundle 中的 New_login_dist 文档及其资源，网络 Welcome/Community 和普通 B 不能借用这一路径。摄像头只向该认证入口的可信主 frame 提示授权；B 媒体请求继续校验来源、前台状态与用户手势。

新 SDK 目录的 API 域名为 `https://server.muzoiplay.online`；原始 H5 路径、字段、Header、年龄/活体 SDK、注册步骤与品牌 UI 保持原产物。

只使用指定 iPhone 17 Pro `D9B138D2-1B08-4646-B8D0-8A2242AECD7D` 进行安装、运行及交互。检查打包后只有 New_login_dist 的 HTML，且没有本地 Welcome/Community 或 MuzoiGlamWeb。账号资料回归、AWS 真机认证和 StoreKit 沙盒真实支付仍需对应环境联调。

开发阶段已核验 Open 别名/非法返回/重试/取消、SDK 入口与身份参数、Welcome/Community 优先级、注册/登录分支、B 消息、Ably 授权与握手、验单请求/成功状态、订单归属和重复隔离。

依据：[Ably TokenRequest](https://ably.com/docs/api/token-request-spec)、[Ably capability](https://ably.com/docs/auth/capabilities)、[Apple 交易完成条件](https://developer.apple.com/documentation/storekit/finishing-a-transaction)。

本次修正验证：Debug/Release 均构建成功，协议测试通过；两种 App 包仅含 `New_login_dist/index.html`，认证资源逐文件一致，没有根目录重复 index、Welcome/Community 副本或 MuzoiGlamWeb。指定 iPhone 17 Pro 已安装最终版本并观察到 New_login_dist 登录页。启动日志 Open HTTP 200，未见崩溃或约束冲突。

加载样式验证：指定 iPhone 17 Pro 录制了实际冷启动，启动背景、原生彩妆加载层及远程 Welcome 连续显示；日志未见崩溃或约束冲突。当前加载改动未提交真实账号认证或支付，未改认证 API、SDK 产物及本地用户数据。
