# minna-design

tomo・hotline・決算/株価データ検証の3サイト共通のデザイン（色・余白・文字・共通部品）の正本。

- `css/tokens.css` — 色・余白・文字サイズの値
- `css/base.css` — 共通の土台（見出し、余白ユーティリティ、ヘッダー/タブ/ナビ）
- `DESIGN_SYSTEM.md` — 原則とルール
- `sync.bat` — 各サイトの `docs/css/shared/` へコピー

```
sync.bat C:\minnanosaiban\tomo
```

サイト側の `mkdocs.yml` では `css/shared/tokens.css` → `css/shared/base.css` の順に、サイト固有のCSSより先に読み込む。
