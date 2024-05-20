#　テーブル設計


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |

### Association

- has_many :posts

## posts テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| title      | string | null: false |
| date       | string | null: false |
| synopsis   | string | null: false |
| author     | string | null: false |
| publisher  | string | null: false |
| thoughts   | string | null: false |
| evaluation | string | null: false |
| tag        | string | null: false |

### Association

- belongs_to :user