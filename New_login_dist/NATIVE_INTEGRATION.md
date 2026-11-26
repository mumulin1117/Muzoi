# 原生接入

## 原生接入修改边界（必读）

原生接入方对随包 H5 **只允许修改以下三类内容**：

- **文案**：应用名称（包括两处 `AppName`）、页面文字、隐私政策和服务条款。
- **配色**：业务页面及活体组件的颜色样式。
- **服务域名**：`config/face-config.js` 中的 `baseUrl`，替换为后台确认的正式 HTTPS 域名。

**除此之外，必须保持 H5 原样，严禁修改逻辑和功能。** 注册步骤、授权及会话创建时机、AWS 采集、结果查询、错误重试、取消、导航、数据处理和桥接行为均不得修改。

**接口名称、路径、Header 名称、请求和响应字段必须沿用 H5 当前的原始名称，严禁改为后台文档中的混淆名称。** `face-config.js` 除 `baseUrl` 外的配置键与值均不得修改，包括 `openPath`、`userStatusPath`、`sessionPath`、`resultPath`、`declinePath`。不得增加混淆映射、替换接口或调整传参／响应解析逻辑。

宿主身份仍按下文约定通过入口 Query 传入实际值，参数名称及 H5 处理逻辑保持不变。文案或配色修改涉及源码时，修改后重新构建并完整交付 `dist/`。

## 准备：替换接口域名

嵌入前，将交付包 `config/face-config.js` 中的 `baseUrl` 改为后台确认的正式 HTTPS 域名，其他配置保持交付值，不修改接口路径、名称或字段。Muzoi 使用 App ID 48934308 的 LIVENESS_ONLY 配置；只使用 Open、user-status、session、result、decline 五个接口，不需要选图、图片上传或 referenceImageId。

昵称页查询新老用户，email 使用 nickname；老用户直接 Open，已认证 session 同样补调 Open，两分支仍使用 Open h5Url 交接。face5 不再显示末尾邮箱密码页，正常 result 成功后保持 Processing，自动 Open（email=nickname、无 password），提前返回立即交接、最多等待 1 秒，始终用 result h5Url；截止只结束等待，请求可继续，迟到响应不影响交接。离页、换流程或卸载清理请求；后台不交接，恢复原有效采集页后直接交接，不再请求或等待。完整字段、校验及生命周期见产品与接口边界。

## 第一步：嵌入并加载入口

将本认证组件放入 iOS 项目 `MuzoiZZZZ/New_login_dist`，保留 `index.html`、`assets/`、`config/` 相对位置。通过文件夹资源引用打包，Welcome 的 Continue 和 App 退出登录进入此组件。仅此认证组件使用 WKWebView.loadFileURL；Welcome/Community 始终使用 Open 返回的部署 HTTPS 网页，不打包本地副本或兜底。

```text
index.html?appId=项目ID&appVersion=应用版本&deviceId=稳定设备号#/
```

- `appId`、`appVersion`、`deviceId` 必传，使用后台认可的实际值；设备号重复打开保持一致。
- `pushToken` 可选，有值时追加 `&pushToken=推送Token`；所有参数值须 URL 编码，放在 `#` 前。
- `#/` 为欢迎页，`#/login` 可直接进入登录页。参数变化后重新加载。
- 全屏布局，关闭自动 contentInset，安全区由 H5 处理；iOS 当前默认关闭原生侧滑返回（`allowsBackForwardNavigationGestures=false`）。H5 已按 social-app-v3 区分导航来源：H5 按钮返回有 H5 转场，原生／浏览器历史前进后退无 H5 转场，避免与宿主已有动画重复。此修改不自动开启宿主手势，也不增加手势 Bridge；完整启用仍需接入手势协议以管理根页面及弹层锁。

## 第二步：对接 openUrl 桥接

加载前注册 `openUrl`，只对随包 New_login_dist 入口的可信主文档开放。参数为一个 URL 字符串，原生收到后负责打开该链接。

| 容器                 | H5 调用方式                                               | 原生接收方式                                                         |
| -------------------- | --------------------------------------------------------- | -------------------------------------------------------------------- |
| Flutter InAppWebView | `window.flutter_inappwebview.callHandler('openUrl', url)` | 注册 `handlerName: 'openUrl'`，读取 `args[0]`，处理后立即返回 `null` |
| WKWebView            | `window.webkit.messageHandlers.openUrl.postMessage(url)`  | 注册名为 `openUrl` 的 handler，读取 `message.body as? String`        |

H5 优先使用 Flutter 通道。登录老用户及人脸认证成功时交接服务端返回的 `h5Url`；认证失败和取消在 H5 提示重新认证，不调用桥接；原生无需判断认证状态。不传 Token 对象，无额外回执协议；不要记录入口 URL 或返回链接。

## 第三步：配置权限

- 配置相机用途说明及系统权限：iOS 配置 `NSCameraUsageDescription`，其他平台配置对应相机权限；WebView 权限委托允许本页的摄像头请求。
- iOS 开启 `allowsInlineMediaPlayback=true`，允许媒体播放无需额外手势。Got it 后才创建活体会话，成功后启动相机；Tips 阅读期间不请求接口或相机。
- 允许联网访问业务 API、AWS HTTPS／WebSocket 和模型 CDN。

## 第四步：修改文案与配色

上线前仅按实际 App 更新以下文案与配色，涉及源码的修改完成后重新构建并完整打包交付：

- **应用名称**：本交付的页面标题、Logo 替代文本和年龄认证说明已使用 `Muzoi: Glam`，没有遗留 `AppName` 占位。名称不依赖入口 Query 或系统 App 名称。
- **隐私政策、服务条款**：`src/features/legal/content.ts`，替换示例正文，确认人脸照片、视频及认证供应商的数据处理说明；原生 App 的隐私政策与权限用途说明也需同步。
- **配色**：`src/styles/colors.less`；活体组件配色在 `src/features/face/runtime/theme.css`。

原生真机确认：随包认证入口可加载、桥接可接收链接、相机授权正常、返回或切后台后相机释放。


## Muzoi 品牌与法律文案适配（2026-11-24）

本次仅修改 `index.html` 中的主题颜色、Logo 展示样式和产品/法律文案，以及 `assets/common/registration-logo.png`，未编辑 iOS 工程。Logo 直接复用项目 `Assets.xcassets/AppIcon.appiconset/Muzoilolog.png`；主背景为 `#0c0e15`，主按钮使用项目的粉紫渐变与深色文字，法律链接沿用薄荷绿色。

隐私政策和服务条款以项目原生 `FoundationShadeMuzCovenantCheckHighlightTechniqueMuz.swift` 的全文为基础，补充当前注册产物实际收集的昵称、生日、性别及年龄/活体认证处理说明。产品主题、AI Makeup Artist、内容权限、举报屏蔽、账号注销和联系邮箱均与 Muzoi 项目一致。

年龄说明已移除互相矛盾的“认证后立即删除”与“继续私自保留自拍”表述；没有新增未经核实的自动删除时限。AWS Face Liveness 的视频及结果处理依据为现有 SDK 和 [AWS 官方说明](https://docs.aws.amazon.com/rekognition/latest/dg/face-liveness.html)。后台实际的留存和删除策略仍由现有服务配置决定，本次没有更改后台处理。

当前目录只提供构建产物，没有对应 Vue/TypeScript 源码或构建配置，因此本次直接对 dist 作受限修改。已对整个内嵌 JS 模块做替换回溯对比：屏蔽法律内容、品牌名称、Logo alt 和认证说明文字后，编译后的业务代码与原文件逐字一致。`face-runtime.js`、`face-runtime.css`、`config/face-config.js` 和其余资源保持原字节不变。上游源码若将来重新构建，需要同步本次主题和内容，避免覆盖品牌适配。

验证仅在本地静态预览检查主页、登录、注册首步及两份协议；不提交登录、用户状态查询或活体认证，不调用实际 API，也不请求摄像头。原生联调与认证服务验证不在此次配色和文案调整范围。

## Muzoi 当前接入

App 启动页和社区页使用 Open 返回的 HTTPS h5Url。Welcome Continue 后直接打开项目接入的 New_login_dist 组件；退出登录复用同一组件，不需要另一个部署 URL。宿主注入实际 appId=48934308、appVersion、deviceId 和可选 pushToken，原始 H5 接口路径及字段不改写。`config/face-config.js` 的 baseUrl 为 `https://server.muzoiplay.online`。

原生只向随包入口的可信主 frame 提供 openUrl 和相机授权提示。SDK 的注册步骤、认证交互、年龄/活体流程及品牌 UI 保持原样。新增原生代码和认证组件均放在 MuzoiZZZZ；MuzoiGlamWeb 目录不再使用。
