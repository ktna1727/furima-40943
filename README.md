# Usersテーブル
| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| nick_name  | string | null: false               |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| last_name  | string | null: false               |
| first_name | string | null: false               |
| birthday   | date   | null: false               |
### Association
has_many :items
has_many :orders

# Itemsテーブル
| Column                      | Type       | Options           |
| --------------------------- | ---------- | ----------------- |
| item_name                   | string     | null: false       |
| description                 | text       | null: false       |
| price                       | integer    | null: false       |
| user                        | references | foreign_key: true |
### Association
belongs_to :user
has_one :order

# Ordersテーブル
| Column                      | Type       | Options           |
| --------------------------- | ---------- | ----------------- |
| item                        | references | foreign_key: true |
| user                        | references | foreign_key: true |
### Association
belongs_to :item
has_many :users
has_one :address
# Addressesテーブル
| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| post_number    | integer    | null: false       |
| municipalities | string     | null: false       |
| street_address | integer    | null: false       |
| building_name  | string     |                   |
| phone_number   | integer    | null: false       |
| order          | references | foreign_key: true |
### Association
belongs_to :order
