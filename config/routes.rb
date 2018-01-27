Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  
  resources :wishlists, only: %i[create destroy index]

  get '/get_wishlist', to: 'wishlists#get_wishlist'

  post '/add_into_wishlist', to: 'products#add_into_wishlist'
end
