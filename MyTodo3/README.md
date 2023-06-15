# 子どものためのやることリスト

# アプリ概要

![アプリ画面](/img/note.png) 

ブラウザから動くノートアプリになります。  
データは現状ローカルストレージ、またはデータベースに保存されます。

作製の動機
- Macのメモ帳は便利だがWindowsでは使えない為、環境依存が低いアプリが欲しい。
- Notionは高機能で使いこない。（https://www.notion.so/）
- 将来、自分で拡張でき、必要な機能を絞れるアプリを作りたい。

# セットアップ手順

《注記》
実行環境にNode.js 、データベースに PostgreSQL を使用します。
インストールされていない場合は別途インストールが必要です。

1. クローンを実施する
```zsh
$ git clone https://github.com/your-username/your-project.git
```
2. クローンしたフォルダのpackage.jsonがある階層に移動する
```zsh
$ cd your-project
```
3. 使用モジュールをインストールする
```zsh
$ npm install
```
4. データベースを作成する
```zsh
$ echo "CREATE DATABASE solomvp;" | psql
```
5. マイグレーションをする
```zsh
$ npm run migrate
```
6. シードをする
```zsh
$ npm run seed
```
7. バックエンド（サーバー）を起動する
```zsh
$ npm run server
```
8. フロントエンド（React）を起動する・・・npm start
```zsh
$ npm start
```

以上でセットアップは終了です。お疲れ様でした。

#　使い方

1. 画面左サイドバーの「追加」ボタンから新しいノートを作成します。
2. 画面左サイドバーから編集したいノートを選択（クリック）すると右上編集画面からタイトルや本文が編集できます。
3. 作成したデータは右下プレビュー画面から確認できます。
4. ノートは編集すると更新日が新しくなり、画面左サイドバーの上側に表示される為、使用頻度が把握できます。
5. 不要なノートは、「削除」ボタンを押すと削除されます。

#　便利な機能

本文の編集欄はマークダウン記法に対応しています。
右下プレビュー画面で反映されて表示します。

[マークダウンの基本的使い方①](https://qiita.com/tbpgr/items/989c6badefff69377da7)  
[マークダウンの基本的使い方②](https://backlog.com/ja/blog/how-to-write-markdown/)

Reactコンポーネント : react-markdown

《使用例》
以下のようにReactMarkdownタグで囲んだ範囲に反映されます。

```
<ReactMarkdown className="markdown-preview">
  {activeNote.content}
</ReactMarkdown>
```
# 開発環境

プログラミング言語 : JavaScript

- 実行環境　: node.js
- フロントサイド : React
- サーバー : Express
- データベース : PostgreSQL
- クエリビルダ : knex
- Reactコンポーネント : react-markdown

スキーマ

![スキーマ](/img/schema.png) 

プログラム構成

![構成](/img/composition.png) 

# 参考ページ

- [node.js](https://nodejs.org/ja/docs)
- [React](https://ja.legacy.reactjs.org/docs/getting-started.html)
- [express](https://expressjs.com/ja/4x/api.html)
- [PostgreSQL](https://www.postgresql.jp/document/15/html/)
- [Knex](http://knexjs.org/)
- [react-markdown](https://www.npmjs.com/package/react-markdown?activeTab=readme)

# 将来の計画

- データベースへ修正データを変更する為のPATCHメソッドの実装
- データベースへの不要データを削除する為のDELETEメソッドの実装
- データベース使用時の更新日が正常に動かない不具合の修正
- content内への画像の挿入
- content内への表の挿入
- render / Firebaseへのデプロイ
- レイアウトの調整
