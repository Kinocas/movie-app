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
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| genre_id      | integer    | null: false                    |
| evaluation_id | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## chats テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| chat   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :chat