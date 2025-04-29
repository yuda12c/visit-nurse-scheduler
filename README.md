## アプリケーション名
訪問看護週間スケジュール立案アプリ

## アプリケーション概要
本アプリは、訪問看護ステーション向けのスケジュール・利用者管理ツールです。看護師やセラピストの勤務状況を把握しやすくし、利用者の情報と紐づけて、訪問スケジュールを簡単に管理できるように設計されています。

## アプリケーションを作成した背景
私が現在働いている訪問看護の現場では、スケジュール調整を紙で行っているため、空き時間の確認や調整に時間がかかる課題がありました。  
また、利用者ごとの希望時間や条件が共有されにくく、スタッフ間の情報連携にも課題がありました。

自身の現場経験から、スケジュールと利用者情報を一元管理できるツールの必要性を感じ、本アプリを開発しました。

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
- スタッフの勤務時間・勤務曜日の登録
- 利用者情報の登録（住所・保険情報・加算情報など）
- 保険の種類によるスケジュール分類
- JavaScriptによるスケジュール詳細の非同期表示・編集


## 操作デモ（動画）
- スタッフ新規登録動画
名前、メールアドレス、勤務曜日、勤務時間、資格を入力します。
登録後、選択した曜日にのみ新規スタッフのスケジュールが表示されます。
[![Image from Gyazo](https://i.gyazo.com/ab6c8f7793aedb7fc1cf198f8f0c2cba.gif)](https://gyazo.com/ab6c8f7793aedb7fc1cf198f8f0c2cba)

- スケジュール登録動画
訪問スケジュールの登録です。担当スタッフ、利用者、訪問曜日、開始時刻、終了時刻を入力。
必要に応じてサブ担当スタッフの選択、希望時間帯の入力、メモ欄への情報追加など入力します。
[![Image from Gyazo](https://i.gyazo.com/5bab23c99d3eefd1ea120134bbf22a0b.gif)](https://gyazo.com/5bab23c99d3eefd1ea120134bbf22a0b)

- スケジュール更新動画
担当や曜日、時間を変更したい場合はスケジュール一覧から該当の患者様の名前をクリックし、スケジュール詳細を開きます。
必要な情報を入力し、更新するを押すと情報を更新できます。
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
- デプロイ：Render

## セットアップ方法（開発環境）

リポジトリをクローン
```bash
git clone https://github.com/yourname/visit-nurse-scheduler.git
cd visit-nurse-scheduler

bundle install

rails db:create
rails db:migrate

bin/dev
```

## 工夫したポイント
[実際の訪問看護業務を意識した設計]
- 現場経験を活かし、「スタッフの勤務曜日」「勤務時間」「資格情報」など、実務に即した項目をDBスキーマに反映
- 利用者情報には「保険情報」や「加算情報」も管理できるようにし、請求業務や訪問計画作成に配慮した構造に実装しました

[スケジュール表示の工夫]
- 勤務曜日を設定することで、出勤日の曜日にのみスケジュールが表示されるように実装
- JavaScriptを使用してスケジュール詳細を非同期で表示し、「閉じる・削除・編集」を同画面で操作可能にすることで、ページ遷移の手間を削減

[UI/UXの工夫]
- 時間や曜日などの入力をセレクトボックスで選択できるようにし、直感的で入力ミスの少ないUIを実現
- スタッフ・患者登録画面では、日本語のバリデーションエラーメッセージを複数項目に分けて丁寧に表示