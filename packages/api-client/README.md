# api-client

**contracts 仓（`tommax-bai/ishome-contracts`）生成，禁手写。**

- 来源：contracts 仓 OpenAPI（BFF REST，snake_case 端到端）与 proto 生成的 TS SDK。
- 本包只做生成物的再导出与薄封装（鉴权头、错误信封解包），**不允许出现手写的端点路径或请求体类型**。
- apps 内出现 `fetch(` / `axios` 直连后端即 CI 报警（`scripts/check-no-direct-fetch.sh`），唯一豁免区是本包。

接线方式（generated SDK 的消费坐标）以 contracts 仓 README 为准。
