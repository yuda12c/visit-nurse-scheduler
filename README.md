## アプリケーション名
訪問看護週間スケジュール立案アプリ

## アプリケーション概要
本アプリは、訪問看護ステーション向けのスケジュール・利用者管理ツールです。看護師やセラピストの勤務状況を把握しやすくし、利用者の情報と紐づけて、訪問スケジュールを簡単に管理できるように設計されています。

**主な想定ユーザー：**
- 訪問看護ステーションの管理者・スタッフ
- 訪問スケジュールの調整業務を行う職員

## URL
- 本番環境（Render）：https://visit-nurse-scheduler.onrender.com

## テスト用アカウント
- Basic認証ID : yuda
- Basic認証パスワード : 1222

## 主な機能
- カレンダーによるスケジュールの可視化
- 同時間帯の複数予定を横並びで表示
- スタッフの勤務時間・勤務曜日の登録
- 利用者情報の登録（住所・保険情報・加算情報など）
- タグによるスケジュール分類
- JavaScriptによるスケジュール詳細の非同期表示・編集


## 実動作画面
- スタッフ新規動画
[![Image from Gyazo](https://i.gyazo.com/ab6c8f7793aedb7fc1cf198f8f0c2cba.gif)](https://gyazo.com/ab6c8f7793aedb7fc1cf198f8f0c2cba)

- スケジュール登録動画
[![Image from Gyazo](https://i.gyazo.com/5bab23c99d3eefd1ea120134bbf22a0b.gif)](https://gyazo.com/5bab23c99d3eefd1ea120134bbf22a0b)

- スケジュール更新動画
[![Image from Gyazo](https://i.gyazo.com/221bed83e28d75d046d29ead7916f31f.gif)](https://gyazo.com/221bed83e28d75d046d29ead7916f31f)


## テストコード結果
[![Image from Gyazo](https://i.gyazo.com/d70ea9a18d6b205739af0f41e67fb7e1.png)](https://gyazo.com/d70ea9a18d6b205739af0f41e67fb7e1)

[![Image from Gyazo](https://i.gyazo.com/5a343028d70d345ced5569c033b66194.png)](https://gyazo.com/5a343028d70d345ced5569c033b66194)

[![Image from Gyazo](https://i.gyazo.com/85ab03662bf105f0ced4a6678634e6bb.png)](https://gyazo.com/85ab03662bf105f0ced4a6678634e6bb)

## 実装予定の機能
- 週に何日、何曜日予定が入っているか患者詳細に記載
- ログイン機能実装し、閲覧、編集の権限を分ける

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/c492c7c20255f1f299241bd64d379b30.png)](https://gyazo.com/c492c7c20255f1f299241bd64d379b30)


## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/af36a526796f0e9432c1b23877869933.png)](https://gyazo.com/af36a526796f0e9432c1b23877869933)

## 使用技術
- フロントエンド：HTML / CSS / JavaScript / Turbo
- バックエンド：Ruby on Rails 7
- データベース：PostgreSQL
- 認証機能：Devise
- デプロイ：Render

## セットアップ方法（開発環境）

リポジトリをクローン
git clone https://github.com/yourname/visit-nurse-scheduler.git
cd visit-nurse-scheduler

必要なGemをインストール
bundle install

データベースを作成＆マイグレーション
rails db:create
rails db:migrate

サーバー起動
bin/dev

## 工夫したポイント
[実際の訪問看護業務を意識した設計]
- 現場経験を活かし、「スタッフの勤務曜日」「勤務時間」「資格情報」など、実務に即した項目をDBスキーマに反映
- 利用者情報には「保険情報」や「加算情報」も管理できるようにし、請求業務や訪問計画作成に配慮した構造に実装

[スケジュール表示の工夫]
- 同一時間帯に複数の予定がある場合は、1セルずつ横に並べて表示し、「1行目：名前」「2行目：時間」となるようにUIを調整
- JavaScriptを用いてスケジュール詳細を非同期で表示し、「閉じる・削除・編集」を同画面で操作可能にすることで、ページ遷移の手間を削減

[UI/UXの工夫]
- 時間や曜日などの入力をセレクトボックスで選択できるようにし、直感的で入力ミスの少ないUIを実現
- スタッフ・患者登録画面では、日本語のバリデーションエラーメッセージを複数項目に分けて丁寧に表示