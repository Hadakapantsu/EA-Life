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
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false | 
| email           | string  | null: false |
| password        | string  | null: false |
| password        | string  | null: false |

### Association
- has_many :pet_profile
- has_many :messages
- has_many :breeding_diary
- has_one :user_profile

## user_profile テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| image          | string     | null: false                    |
| name           | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| hobby          | string     | null: false                    |
| text           | string     |                                |
| user           | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## pet_profile テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| image          | string     | null: false                    |
| name           | string     | null: false                    |
| species_name   | string     | null: false                    |
| gender         | integer    | null: false                    |
| age            | integer    | null: false                    |
| birthday       | date       |                                |
| favorite_food  | string     | null: false                    |
| skill          | string     | null: false                    |
| text           | string     |                                |
| user           | references | null: false, foreign_key: true |
| messages       | references | null: false, foreign_key: true |
| breeding_diary | references | null: false, foreign_key: true |

### Association
- belongs_to :user, through :pets_profile_user
- has_one :message
- has_one :breeding_diary


## messages テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| message      | string     | null:false                     |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :pet_profile


## breeding_diary テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| calendar           | string     |                                |
| year               | integer    |                                |
| month              | integer    |                                |
| day                | integer    |                                |
| poop_condition     | string     |                                |
| weight             | string     |                                |
| pets_profile       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :pet_profile

## SnsCredentials テーブル

| Column   | Type       | Options          |
| -------- | ---------- | ---------------- |
| provider | string     | null: false      |
| uid      | string     | null: false      |
| user_id  | references | foreign_key:true |

### Association

- belongs_to :user, optional: true


<!-- ## pets_profile_users テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| pets_profile | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :
- has_one : -->