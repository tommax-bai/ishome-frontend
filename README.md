# ishome-frontend

《是我的家》前端 monorepo（pnpm workspace，TypeScript）。

> 基线文档在中控仓 `ishome`：《AI装修效果图产品-技术架构方案》§4（前端与管理后台）、《开发规范与代码分层》§1.4（前端分层）。
> `{code}` 代号当前为工作默认 `ishome`，见中控仓《落地假设与拍板清单》。

## 仓库地图

```
apps/
  c-app/        # C 端：uni-app（Vue3）一码双端。H5 承接"指图时刻"，小程序 = 分享卡片 + 支付容器
  admin-web/    # 管理后台：RuoYi-Vue-Plus 基座；自研只砸模板验收台
packages/
  ui/           # 跨端共享 UI 组件
  api-client/   # 由 contracts 仓生成的 API 客户端，禁手写
scripts/
  check-no-direct-fetch.sh   # CI 纪律：apps 内禁手写 fetch/axios 直连后端
```

## 两条分层铁律（规范 §1.4）

1. **apps 只做装配，业务逻辑进 packages。**
2. **API 调用只走生成的 api-client**——仓库内 grep 到手写 `fetch(` / `axios` 直连后端即 CI 报警（`scripts/check-no-direct-fetch.sh`）。

## 状态

骨架阶段。c-app 的 uni-app 脚手架细则待前端选型细化后补；前端代码级规范同步补入规范文档 §1.4。

## 本地质量门（pre-push）

云端 CI 停用期间的本地把关：push 前自动跑本仓全套检查。新 clone 后执行一次 `git config core.hooksPath .githooks` 启用；紧急绕过用 `git push --no-verify`。
