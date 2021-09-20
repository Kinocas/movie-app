# アプリ名
- MovieApp

# 概要
- 観た映画の評価や感想を投稿機能
- 自分自身の映画一覧表示
- 他ユーザーとのチャット機能
- 月別での投稿の集計

# 制作背景
私自身が映画をよく観るので、自分が観た映画をまとめれるものはないかと思い作成しました。
また、他の人の投稿を共有できたり、カテゴリーから自分の好みに合ったものを検索することができます。

# DEMO
## トップページ
![image](https://i.gyazo.com/8417ee40558920cbca9f855ed69e4073.jpg)
- ログインしてないユーザーでも一覧表示することが可能。（新規投稿は不可）
- ログインすることで、新規投稿することが可能。
- 検索欄から、目的の投稿を探すことが可能。

## 新規投稿ページ
![image](https://i.gyazo.com/8654fb33d4bda3a05354278cb5f91076.png)
- 映画のタイトル、画像、感想、ジャンル、評価を記入し投稿。
- 投稿を公開するかの選択も可能。(公開しない場合、マイページでのみ閲覧可能)

## マイページ
![image](https://i.gyazo.com/e663ff878d088b342375b8a8e7c1d1fc.jpg)
- 自分自身が投稿した一覧を表示
- 合計数ボタンから、選択した年の月別での投稿本数を、表とグラフで表示する。
- 検索欄から、目的の投稿を探すことが可能。
- 左上のチェック欄で、すべて、公開、非公開の投稿を切り替え可能。

## 詳細ページ
![image](https://i.gyazo.com/0d06ab04d227997d96841656f829e8f8.png)
- 投稿内容の詳細内容を表示する。
- 投稿したユーザーのみに削除と編集ボタンが表示される。(投稿したユーザーのみ削除と編集が可能)

## チャットルーム一覧
![image](https://i.gyazo.com/993f71f7de0aad7890ca6096ec0dc5ab.png)
- チャットルームを作成するボタンが表示
- 作成されたチャットルームを表示

## チャットルーム
![image](https://i.gyazo.com/47ead5d916d0a21f8544418c89a3f625.png)
- チャットルーム内でチャットできる
- チャットの内容を閲覧できる


# 使用技術（開発環境）
## バックエンド
Ruby, Ruby on Rail
## フロントエンド
HTML, CSS, JavaScript
## データベース
MySQL
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