# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| -------------------|---------|-------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| lastname_full      | string  | null: false               |
| firstname_full     | string  | null: false               |
| lastname_kana      | string  | null: false               |
| firstname_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column               | Type       | Options                        |
| ---------------------|------------|------------------------------- |
| name                 | string     | null: false                    |
| explan               | text       | null: false                    |
| category_id          | integer    | null: false                    |
| status_id            | integer    | null: false                    |
| shippingfee_payer_id | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| shipping_day_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Associaion
- belongs_to :user
- has_one :order

## order テーブル

| Column             | Type       | Options                        |
| -------------------|------------|------------------------------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column             | Type       | Options                        |
| -------------------|------------|------------------------------- |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalitie      | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | integer    | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :order