class Post < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :author, presence: true
  validates :thoughts, presence: true, allow_nil: true

  def resized_image
    if image.attached?
      image.variant(resize: '400x300').processed
    else
      nil
    end
  end

  def self.create_from_isbn(isbn)
    book_data = fetch_book_data(isbn)
    return unless book_data.present?
  
    # ブックデータで thoughts フィールドが提供されていない場合にデフォルト値を設定
    book_data[:thoughts] ||= "感想を記入してください"

    # デフォルトの evaluation_id を設定
    book_data[:evaluation_id] ||= 0

    book_data[:tag] ||= ""
    
  
    create(book_data)
    
  end

  private

  def self.fetch_book_data(isbn)
    response = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}")
    if response.success?
      body = JSON.parse(response.body)
      book_info = body['items'][0]['volumeInfo']
      {
        title: book_info['title'],
        date: book_info['publishedDate'],
        synopsis: book_info['description'],
        author: book_info['authors']&.join(', '),
        publisher: book_info['publisher'] || 'Unknown Publisher', # デフォルト値を設定する
        cover_url: book_info['imageLinks']['thumbnail'] # カバー画像のURLを取得する
      }
    else
      nil
    end
  end
end
