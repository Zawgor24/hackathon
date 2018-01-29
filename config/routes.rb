Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  
  resources :wishlists, only: %i[create index] do
    collection do
      post '/delete_product', to: 'wishlists#destroy'
    end
  end

  get '/get_product', to: 'products#index'
end
