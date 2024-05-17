class AddCoverUrlToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :cover_url, :string
  end
end
