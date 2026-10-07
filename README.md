# ccadv-sample

YouTube チャンネル「ずんだもんの実験道具箱」の「Claude Code入門（応用編）」の回で使ったサンプルです。プラグイン `safe-dev` を1つ入れた、最小のマーケットプレイスになっています。

## 入っているもの

`safe-dev`:

- スキル `run-tests-and-report` — `npm test` を走らせ、パス数・失敗数を報告する（呼び出しは `/safe-dev:run-tests-and-report`）
- hook — Bash の `rm -rf` を PreToolUse で止める

前提: hook のスクリプト（`plugins/safe-dev/scripts/block-rm-rf.sh`）は `jq` を使います。`jq` が無い環境では hook が動きません。

## 入れ方

Claude Code の中で:

```
/plugin marketplace add zun-tools/ccadv-sample
/plugin install safe-dev@ccadv-sample
```

インストールの詳細画面で効く範囲を選びます。

- user — 自分の全プロジェクトで有効（先頭の選択肢）
- project — このリポジトリの `.claude/settings.json` に書かれ、チームで共有できる
- local — 自分だけ・このリポジトリだけ（`.claude/settings.local.json`）

注意: 対話の `/plugin marketplace add` はユーザー設定に登録されます。プロジェクトやローカルにだけ登録したいときは、シェルで `claude plugin marketplace add zun-tools/ccadv-sample --scope local`（または `project`）を使います。

## 外し方

```
/plugin manage            # safe-dev を選んで Uninstall
claude plugin marketplace remove ccadv-sample
```

## 検証

```
claude plugin validate ./plugins/safe-dev
claude plugin validate .
```

## 出力スタイル `3lines`（応用編 #17）

`output-styles/3lines.md` — 結論・理由・次にやることの3行で答えさせる自作の出力スタイルです。

使い方: リポジトリの `.claude/output-styles/` （自分の全プロジェクトなら `~/.claude/output-styles/`）に置いて Claude Code を起動し直し、`/output-style 3lines` で切り替えます。

- `keep-coding-instructions: true` で、コードを書くときの既定の指示は残します
- スタイルは答え方の指示で、強制ではありません。いつも守らせたい決まりは CLAUDE.md へ

公式ドキュメント: https://code.claude.com/docs/en/output-styles.md

## 出典

公式ドキュメント: https://code.claude.com/docs/en/plugins/create-marketplace.md ・ https://code.claude.com/docs/en/plugins/install.md

License: MIT
