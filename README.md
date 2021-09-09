# アプリ名
- MovieApp

# 概要
観た映画の評価や感想を投稿できる。
自分自身の映画一覧を表示できる。

# 本番環境

ログイン情報（テスト用）
- Eメール
- パスワード

# 制作背景
私自身が映画をよく観るので、みた映画をまとめれるものはないかと思い作成した。
また、他の人に投稿して共有できたり、投稿したくはないものはマイページに登録できる。

# 工夫したポイント

# 使用技術（開発環境）
## バックエンド
Ruby, Ruby on Rail
## フロントエンド
HTML, CSS, JavaScript
## データベース
MySQL
## インフラ
## Webサーバ（本番環境）
## アプリケーションサーバ（本番環境）
## ソース管理
GitHub, GitHubDesktop
## テスト
RSpec
## エディタ
VSCode

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :movies
- has_many :rooms
- has_many :chats


## movies テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| movie_title   | string     | null: false                    |
| image_url     | text       |                                |
| thought       | text       | null: false                    |
| genre_id      | integer    | null: false                    |
| evaluation    | integer    | null: false                    |
| release       | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## rooms テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| room_name | string     | null: false                    |
| purpose   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :chats

## chats テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| chat   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room