# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column                | Type        | Option                   |
| --------------------- | ----------- | ------------------------ |
| nickname              | string      | null: false              |
| email                 | string      | null: false unique: true |
| encrypted_password    | string      | null: false              |
| name                  | string      | null: false              |
| name_reading          | string      | null: false              |
| birthday              | integer     | null: false              |

### Association

- has_many :products
- has_many  :records
- has_one  :destinations

## products テーブル

| Column       | Type       | Option           |
| ------------ | ---------- | ---------------- |
| product_name | string     | null: false      |
| content      | text       | null: false      |
| category_id  | integer    | null: false      |
| status_id    | integer    | null: false      |
| postage_id   | integer    | null: false      |
| area_id      | integer    | null: false      |
| day_id       | integer    | null: false      |
| price        | string     | null: false      |
| user         | references | foreign_key:true |

### Association

- belongs_to :user
- belongs_to :record

## records テーブル

| Column       | Type       | Option           |
| ------------ | ---------- | ---------------- |
| product_name | string     | null: false      |
| content      | text       | null: false      |
| category_id  | integer    | null: false      |
| user         | references | foreign_key:true |

### Association

- has_many   :products
- has_one    :destinations
- belongs_to :user


## destinations テ-ブル

| Column         | Type       | Option           |
| -------------- | ---------- | ---------------- |
| postcode       | string     | null: false      |
| prefecture     | string     | null: false      |
| municipalities | string     | null: false      |
| address        | string     | null: false      |
| building       | string     |                  |
| tel            | string     | null: false      |
| record         | references | foreign_key:true |

### Association

- has_many   :records
- belongs_to :user
- belongs_to :record
