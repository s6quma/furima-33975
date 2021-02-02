# README

## users

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false               |
| password              | string | null: false, unique: true |
| first_name            | string | null: false               |
| last_name             | string | null: false               |
| first_name_reading    | string | null: false               |
| last_name_reading     | string | null: false               |
| birthday              | date   | null: false               |


## Association
has_many :items
has_many :purchase_histories



## items

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


## Association
belongs_to :user
has_one :purchase_history

(active_hash)
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :condition
belongs_to :shipping_charge
belongs_to :area
belongs_to :shipping_date



## purchase_histories

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |


## Association
belongs_to :item
has_one :mailing_address



## mailing_addresses

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| block_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | integer    | null: false                    |
| purchase_history_id | references | null: false, foreign_key: true |


## Association
belongs_to :purchase_history

(active_hash)
belongs_to :prefecture





- itemsのimagesはactive_storageテーブルでの管理を行う

- 決済はPAY.JPを扱う

- active_hashの作成

- category
- condition 
- shipping_fee 
- area
- shipping_date 
- prefecture