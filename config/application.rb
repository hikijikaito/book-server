require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module BookApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    
    # Active Storage variant processor configuration
    config.active_storage.variant_processor = :mini_magick
    
    # Set the URL host for Active Storage
    config.active_storage.url_options = { host: 'book-server-kwgn.onrender.com', protocol: 'https' }
    
    # Set the URL options globally using ActiveStorage::Current
    config.active_storage.current = config.active_storage.url_options
    
    # Active StorageのURLの有効期限を1年に設定
    config.active_storage.service_urls_expire_in = 1.year
    
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # CORS設定を追加する
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "https://book-client-ruby.vercel.app" # リクエストを許可するオリジンを指定します。

        resource "*", # すべてのリソースに対して
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head] # 全てのHTTPメソッドを許可します。
      end
    end
  end
end
