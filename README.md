# テーブル設計

## users テーブル　ユーザー情報

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| first_name         | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル 商品情報

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category     | text       | null: false                    |
| item_status  | integer    | null: false                    |
| shipping_cost| integer    | null: false                    |
| delivery_area| integer    | null: false                    |
| delivery_date| integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル　購入者情報

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| user      | references   | null: false, foreign_key: true |
| item      | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :payment

## payments テーブル　支払い情報

| Column      | Type         | Options                        |
| ---------   | ------------ | ------------------------------ |
| postcode    | string       | null: false                    |
| prefecture  | integer      | null: false                    |
| city        | string       | null: false                    |
| block       | string       | null: false                    |
| building    | string       |                                |
| phone_number| string       | null: false                    |
| order       | references   | null: false, foreign_key: true |


### Association

- belongs_to :order
