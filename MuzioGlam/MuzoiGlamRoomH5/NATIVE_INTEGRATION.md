# Room H5 原生接入

权威配置与精简协议说明位于 `config/app-config.js` 顶部。原生只需负责加载、关闭和充值。

## 加载

- 直播：`index.html#/live/{roomId}?token={token}&userId={userId}&appVersion={version}&deviceNo={deviceNo}`
- 语聊：`index.html#/voice/{roomId}?token={token}&userId={userId}&appVersion={version}&deviceNo={deviceNo}`
- 可选参数：`locale`；全部参数必须 URL 编码。
- `userId` 是当前 Token 对应的用户 ID；资料接口未返回 ID 时，H5 使用该值建立用户身份。
- `token` 不带 `Bearer ` 前缀，仅保存在 H5 内存中，并在启动后从 URL 删除。
- WebView 重载必须重新生成带 token 的初始 URL。

Swift 使用 `WKWebView.loadFileURL(_:allowingReadAccessTo:)`，读取范围覆盖整个 `dist`。Flutter 使用本地文件 URL 加载整个 `dist`，并注册名为 `roomBridge` 的 JavaScriptChannel（名称可在配置中修改）。

## Bridge

H5 向原生发两种 command：

- `room.close`：`payload` 为 `{ roomId, roomType, reason }`，原生关闭 WebView。
- `recharge.open`：`payload` 为 `{ requestId, roomId, roomType, source, requiredDiamonds }`，原生打开充值页。

原生充值成功后执行：

```js
window.__ROOM_H5_BRIDGE_RECEIVE__({
  protocolVersion: 1,
  kind: 'event',
  name: 'recharge.succeeded',
  payload: {
    eventId: 'unique-event-id',
    occurredAt: Date.now(),
    transactionId: 'optional',
  },
})
```

H5 收到后重新获取用户资料和余额。生命周期、联网状态由 H5 自己通过 Web 标准事件管理，无需原生回调。

## 真机注意

- `localhost` 指手机本身；真机前修改 `config/app-config.js` 的 `api.baseUrl`。生产必须使用 HTTPS，HTTP 联调需配置 iOS ATS。
- 后台需接受 `Origin: null`，并允许 `Authorization`、`appId`、`appVersion`、`deviceNo`、`language`、`Content-Type` 请求头。
- 开启内联媒体播放；语聊麦克风需配置 iOS 权限说明并放行 WebView 媒体授权。
- 修改配置后重新签名 App；不要修改配置标记或全局变量名。


## Muzoi 原生接入扩展（协议版本仍为 1）

- H5 command `room.ready`：payload `{roomId,roomType}`，表示文档可以显示，**不证明 RTC 已连接**。切换房间后再次更新原生上下文。
- H5 command `profile.open`：payload `{roomId,roomType,userId}`，由原生打开已有用户主页，保留房间容器。
- Native event `profile.closed`：payload `{userId}`，H5 重新请求资料，并同步关注/拉黑状态。
- Native 可调用并等待 `window.__MUZOI_ROOM_CLOSE__()` 或 `window.__MUZOI_ROOM_DISPOSE__()`，最多等待 2.5 秒清理。关闭与普通清理区别在是否通知原生返回。
- `recharge.succeeded` 仅用于后台已经确认入账的 Apple 交易，不能用普通资料刷新或取消购买替代。
- 本次接入保留原包的 RTC 暂停状态；配置位置、真实房间和有效 Token 补齐后再进行第三阶段。
