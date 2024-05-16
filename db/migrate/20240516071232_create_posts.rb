class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :date
      t.text :synopsis
      t.string :author
      t.string :publisher
      t.text :thoughts
      t.integer :evaluation_id
      t.string :tag, null: true, default: '' # タグのデフォルト値を空文字列に設定

      t.timestamps
    end
  end
end
