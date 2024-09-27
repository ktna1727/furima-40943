# Usersテーブル
| Column    | Type     | Options                   |
| --------- | -------- | ------------------------- |
| nick_name | string   | null: false               |
| email     | string   | null: false, unique: true |
| password  | string   | null: false               |
| name      | string   | null: false               |
| birthday  | datetime | null: false               |
### Association
has_many :items
has_many :orders
has_many :orders, through: :item_orders


# Itemsテーブル
| Column                      | Type       | Options           |
| --------------------------- | ---------- | ----------------- |
| item_name                   | string     | null: false       |
| description                 | text       | null: false       |
| category                    | string     | null: false       |
| condition                   | string     | null: false       |
| sipping_cost_responsibility | string     | null: false       |
| sipping_origin_region       | string     | null: false       |
| estimated_sipping_date      | date       | null: false       |
| price                       | integer    | null: false       |
| user                        | references | foreign_key: true |
### Association
belongs_to :item
belongs_to :orders

# user_ordersテーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| order  | references | foreign_key: true |
### Association
belongs_to :user
belongs_to :order

# Ordersテーブル
| Column                      | Type       | Options           |
| --------------------------- | ---------- | ----------------- |
| item_name                   | references | foreign_key: true |
| price                       | references | foreign_key: true |
| sipping_cost_responsibility | references | foreign_key: true |
| payment_fee                 | integer    | null: false       |
| item                        | references | foreign_key: true |
| user                        | references | foreign_key: true |
### Association
belongs_to :item
has_many :users
has_many :users,through: :user_orders
has_one :address
# Addressesテーブル
| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| post_number    | integer    | null: false       |
| prefecture     | string     | null: false       |
| municipalities | string     | null: false       |
| street_address | integer    | null: false       |
| building_name  | string     |                   |
| phone_number   | integer    | null: false       |
| user           | references | foreign_key: true |
### Association
belongs_to :order
