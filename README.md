# アプリケーション名

BOOK LOG

# アプリケーション概要

読んだ本の感想などを、記録することができる

# URL

https://book-client-ruby.vercel.app/api/auth/signin

# テスト用アカウント

・Googleログイン認証

# 利用方法

### 記録する

1.Googleログイン認証でログインする
2.本に記載のある、ISBNから本の情報を取得する
3.感想を記入し、保存する

# アプリケーションを作成した背景

誰かの役に立つアプリを作るとなった時に、一番身近な奥さんに話を聞いた。年間120冊の本を読むくらい読書が好きなので、『簡単に本の記録ができたら本が更に好きになる』と思いこのアプリの開発を始めた。

# 実装した機能についての画像やGIFおよびその説明

#### ログイン画面
[![Image from Gyazo](https://i.gyazo.com/0ce38d3e81c3f4a6aa20e78c2fc4b091.png)](https://gyazo.com/0ce38d3e81c3f4a6aa20e78c2fc4b091)

#### Google認証
[![Image from Gyazo](https://i.gyazo.com/3a123a7b0cf10bd5876dc13686cb5e90.jpg)](https://gyazo.com/3a123a7b0cf10bd5876dc13686cb5e90)

### トップページ
[![Image from Gyazo](https://i.gyazo.com/43e59bb33036be09d27722c6f612b434.png)](https://gyazo.com/43e59bb33036be09d27722c6f612b434)

### 新規登録画面
[![Image from Gyazo](https://i.gyazo.com/65a04a56316ecab1d60483f73fab7235.png)](https://gyazo.com/65a04a56316ecab1d60483f73fab7235)

### 詳細画面
[![Image from Gyazo](https://i.gyazo.com/ebf3768b9e403e4c6cd94dca60dd6e5f.gif)](https://gyazo.com/ebf3768b9e403e4c6cd94dca60dd6e5f)

### 編集画面
[![Image from Gyazo](https://i.gyazo.com/f18371233c2debef52b99568c14e0d5b.gif)](https://gyazo.com/f18371233c2debef52b99568c14e0d5b)

### 記録の削除
[![Image from Gyazo](https://i.gyazo.com/b13cb30a0e115a284830c3bb7075222b.gif)](https://gyazo.com/b13cb30a0e115a284830c3bb7075222b)

# 実装予定の機能

現在、検索機能を実装中。

# テーブル設計

### users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |

#### Association

- has_many :posts

### posts テーブル

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

#### Association

- belongs_to :user

# 開発環境
・フロントエンド　Next.js
・バックエンド　Ruby on Rails
・インフラ　vercel　render

# 工夫したポイント
開発当初は本のすべての情報を手打ちしていたが、めんどくさいなと思い調べているとISBNから情報を取得できる事が分かった。途中で、Google Books APIから本の情報を取得するように切り替えた。