# Muzoi 独立欢迎页与社区规则页

- `Muzostart.html`：Welcome，自带所有样式、脚本和图片。直接显示欢迎内容；没有 EULA 弹窗、资格勾选、同意落盘或同意后才能继续的拦截。
- `MuzoiGlamCommunityRules.html`：独立社区规则页，正文内部滚动、按钮固定，无返回入口。规则确认与协议阅读继续保留。

两页没有互相跳转的入口，上传各自一个 HTML 即可完整显示。

## Continue 消息

Welcome Continue 通过 `MuzoiWelcome` 发送 `{ action: "Sure", source: "MuzoiWelcome" }`；规则页通过 `MuzoiCommunityRules` 发送 `{ action: "Sure", source: "MuzoiCommunity" }`。按钮保留按下、等待和重复提交保护，原生回执使用 `MuzoiGlamBridge.acknowledge`。浏览器无消息桥时发出 `muzoi:continue` 事件并结束临时等待。

## 当前原生接入

实际宿主在 `MuzioGlam/MuzioGlam/MuzoiZZZZ`。Welcome 确认后直接进入项目随包接入的 New_login_dist 首页；Community 确认后沿用宿主已接入的 A 登录/注册分支。原生仅为 Community 保存规则确认状态，Welcome 不读取或写入 EULA 状态。

本目录页面用于部署为 HTTPS 网页，不作为 App 随包 HTML。原生会移除线上旧 Welcome HTML 的 EULA 弹窗，并把旧 Continue 的同意拦截替换为直接发送原消息；无需伪造或预先写入同意记录。

欢迎页继续固定、禁止上下滚动和回弹；社区页继续只允许正文内部滚动。页面手势限制仅针对各自页面，不注入新版登录表单或普通业务 H5。

只有认证组件 New_login_dist 随 App 打包；本目录的 Welcome/Community 用于部署，App 不保存其本地副本或兜底。
