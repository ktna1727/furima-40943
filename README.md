# Usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
has_many :items
has_many :orders

# Itemsテーブル
| Column                          | Type       | Options                       |
| ------------------------------- | ---------- | ----------------------------- |
| item_name                       | string     | null: false                   |
| description                     | text       | null: false                   |
| price                           | integer    | null: false                   |
| user                            | references | foreign_key: true null: false |
| area_id                         | integer    | null: false                   |
| category_id                     | integer    | null:false                    |
| condition_id                    | integer    | null:false                    |
| estimated_shipping_date_id      | integer    | null:false                    |
| shipping_cost_responsibility_id | integer    | null:false                    |

### Association
belongs_to :user
has_one :order

# Ordersテーブル
| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| item   | references | foreign_key: true,null: false |
| user   | references | foreign_key: true,null: false |
### Association
belongs_to :item
belongs_to :user
has_one :address
# Addressesテーブル
| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| post_number    | string     | null: false                   |
| municipalities | string     | null: false                   |
| street_address | string     | null: false                   |
| building_name  | string     |                               |
| phone_number   | string     | null: false                   |
| order          | references | foreign_key: true,null: false |
| area_id        | integer    | null:false                    |
### Association
belongs_to :order
