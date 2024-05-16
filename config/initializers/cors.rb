Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://book-client-ruby.vercel.app" # リクエストを許可するオリジンを指定します。

    resource "*", # すべてのリソースに対して
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head] # 全てのHTTPメソッドを許可します。
  end
end
