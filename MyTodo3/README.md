# 子どものためのやることリスト

[マークダウンの基本的使い方①](https://qiita.com/tbpgr/items/989c6badefff69377da7)  
[マークダウンの基本的使い方②](https://backlog.com/ja/blog/how-to-write-markdown/)

ロゴやバナー画像
サービスのスクリーンショット画像
必要条件
システム構成図
使い方
インストール方法

# 目次

- アプリ概要🍊
- セットアップ手順🍊
- 使い方🍊
- 便利な機能
- 開発環境🍊
- 参考ページ
- 将来の計画

# アプリ概要

![アプリ画面](/img/note.png) 

ブラウザから動くノートアプリになります。  
データは現状ローカルストレージ、またはデータベースに保存されます。

作製の動機
- Macのメモ帳は便利だがWindowsでは使えない為、環境依存が低いアプリが欲しい。
- Notionは高機能で使いこない。（https://www.notion.so/）
- 将来、自分で拡張でき、必要な機能を絞れるアプリを作りたい。

# セットアップ手順


以上でセットアップは終了です。お疲れ様でした。

#　使い方

1. 画面左サイドバーの「追加」ボタンから新しいノートを作成します。
2. 画面左サイドバーから編集したいノートを選択（クリック）すると右上編集画面からタイトルや本文が編集できます。
3. 作成したデータは右下プレビュー画面から確認できます。
4. ノートは編集すると更新日が新しくなり、画面左サイドバーの上側に表示される為、使用頻度が把握できます。
5. 不要なノートは、「削除」ボタンを押すと削除されます。

#　便利な機能

本アプリは重要度と緊急度に応じて４つの分類をしてやることを管理できます。
これによりやることがたくさんあっても、何を先にやるか、どれが特に大事か
を自然に考え身につけることができます。

 [時間管理のマトリックス](https://www.hr-doctor.com/news/management/engagement/management_time_effective_2steps-7?content=management_time_effective_2steps-7)

# 開発環境

プログラミング言語 : Swift

- 実行環境　: Xcode Version 14.3
- 実行環境 : macOS Ventura Version 13.4
- フレームワーク(フロント) : SwiftUI
- フレームワーク（データベース） : CoreData

スキーマ
🍊
![スキーマ](/img/schema.png) 

プログラム構成
🍊
![構成](/img/composition.png) 

# 参考ページ

- [apple公式開発](https://developer.apple.com/jp/develop/)
- [SF Symbols](https://developer.apple.com/jp/sf-symbols/)
- [作って学ぶSwift/iOSアプリ入門](https://tech.camph.net/how-to-make-ios-app-with-swift/)

# 将来の計画

- アプリアイコンの追加
- 実機での動作確認
- レイアウトの調整
- 定期的なやることの登録
- やること達成時のポイント付与
- ポイント交換機能の実装
