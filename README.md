# テーブル設計

## users テーブル　ユーザー情報

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :comments


## items テーブル 商品情報

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| image            | image      | null: false                    |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comments


## orders テーブル 購入者情報

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| user      | references   | null: false, foreign_key: true |
| item      | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :payment

## payments テーブル 支払い情報

| Column        | Type         | Options                        |
| --------------| ------------ | ------------------------------ |
| postcode      | string       | null: false                    |
| prefecture_id | integer      | null: false                    |
| city          | string       | null: false                    |
| block         | string       | null: false                    |
| building      | string       |                                |
| phone_number  | string       | null: false                    |
| order         | references   | null: false, foreign_key: true |


### Association

- belongs_to :order


## comments テーブル コメント

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| text      | text         | null: false                    |
| user      | references   | null: false, foreign_key: true |
| item      | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
