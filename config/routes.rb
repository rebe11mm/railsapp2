Rails.application.routes.draw do
  resources :products
  get 'static_pages/about', :as => 'about_page'

  get 'static_pages/contact', :as => 'contact_page'

  get 'static_pages/index', :as => 'home_page'

  get '/products', to: 'products#index' , :as => 'products_page'

  root 'static_pages#index'

  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
