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

| Column                | Type        | Option      |
| --------------------- | ----------- | ----------- |
| name                  | string      | null: false |
| email                 | string      | null: false |
| encrypted_password    | string      | null: false |
| password_confirmation | string      | null: false |

### Association

- has_many :products
- has_many  :records
- has_one  :destinations

## products テーブル

| Column       | Type       | Option      |
| ------------ | ---------- | ----------- |
| image        |            | null: false |
| product_name | string     | null: false |
| content      | text       | null: false |
| category     | references | null: false |
| status       | references | null: false |
| postage      | references | null: false |
| area         | references | null: false |
| day          | references | null: false |
| price        | string     | null: false |

### Association

- belongs_to :users
- belongs_to :records

## records テーブル

| Column       | Type       | Option      |
| ------------ | ---------- | ----------- |
| product_name | string     | null: false |
| image        |            | null: false |
| price        | string     | null: false |
|postage       | references | null: false |

### Association

- has_many   :products
- has_one    :destinations
- belongs_to :users


## destinations テーブル

| Column         | Type       | Option      |
| -------------- | ---------- | ----------- |
| postcode       | references | null: false |
| prefecture     | references | null: false |
| municipalities | references | null: false |
| address        | references | null: false |
| building       | string     |             |
| tel            | string     | null: false |

### Association

- has_many   :records
- belongs_to :users
- belongs_to :records

