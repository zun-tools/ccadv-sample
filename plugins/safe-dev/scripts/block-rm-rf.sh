#!/usr/bin/env bash
# PreToolUse(Bash): コマンドに rm -rf を含むなら exit 2 で止める
cmd=$(jq -r '.tool_input.command // ""')
if echo "$cmd" | grep -Eq 'rm[[:space:]]+-rf'; then
  echo "rm -rf は禁止です。個別ファイルを指定してください。" >&2
  exit 2
fi
exit 0
