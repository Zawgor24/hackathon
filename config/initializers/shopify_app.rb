ShopifyApp.configure do |config|
  config.application_name = 'My Shopify App'
  config.api_key = '188a4ff6f52956a1da1ecbd9cd49d3a8'
  config.secret = '00dec23bc2f8a9bc756a9b7a3285966b'
  config.scope = 'read_orders, read_products, read_customers'
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
