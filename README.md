# minna-design

tomo・hotline・決算/株価データ検証の3サイト共通のデザイン（色・余白・文字・共通部品）の正本。

- `css/tokens.css` — 色・余白・文字サイズの値（4サイトとも読み込む）
- `css/base.css` — 共通の土台（見出し、余白ユーティリティ、ヘッダー/タブ/ナビ）
- `css/layout.css` — ページ枠（本文カラム余白・サイドバー・フッター注記）
- `css/components.css` — 部品（目次カード・フッターカード・著作権表記・シェアボタン）
- `css/parts.css` — tomo・hotline 共通のページ部品（タブのドロップダウン、タイトル帯、中央寄せカラム、制作物一覧など）
- `DESIGN_SYSTEM.md` — 原則とルール
- `sync.bat` — 各サイトの `docs/css/shared/` へコピー

```
sync.bat C:\minnanosaiban\tomo
```

サイト側の `mkdocs.yml` では、サイト固有のCSSより先に、次の順で読み込む。

| サイト | 読み込む共通CSS（この順） |
|---|---|
| tomo・hotline | tokens → base → layout → components → parts |
| kessan-kabuka | tokens → base → layout → components |
| e-shikaku | tokens のみ（文字サイズの体系が違うため） |

