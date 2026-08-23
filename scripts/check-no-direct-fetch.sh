#!/usr/bin/env bash
# 纪律检查（规范 §1.4）：apps 内禁止手写 fetch(/axios 直连后端。
# API 调用只允许走 packages/api-client（contracts 生成）。
# 豁免区：packages/api-client 本身（生成物与薄封装所在地）。
set -euo pipefail

cd "$(dirname "$0")/.."

# 只查源码文件；node_modules/dist 排除
matches=$(grep -rnE '(fetch\(|axios)' apps packages \
  --include='*.ts' --include='*.tsx' --include='*.vue' --include='*.js' \
  --exclude-dir=node_modules --exclude-dir=dist --exclude-dir=.output 2>/dev/null \
  | grep -v '^packages/api-client/' || true)

if [[ -n "$matches" ]]; then
  echo "❌ 检测到 api-client 之外的手写 fetch(/axios 直连："
  echo "$matches"
  echo
  echo "API 调用只允许走 @ishome/api-client（contracts 仓生成）。"
  exit 1
fi

echo "✅ no-direct-fetch 检查通过"
