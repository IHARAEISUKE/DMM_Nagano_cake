Rails.application.routes.draw do


  devise_for :customers, controllers:{
   sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }

  devise_for :admin, controllers:{
     sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'

  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'public' do
  root to: 'homes#top'
  get "homes/about"
  get "customers/check"
  patch "customers/status"
  resources :customers
  resources :shipping_addresses
  resources :items, only: [:index, :show]
  resources :order_histories do
    collection do
     post "check"
     get "complete"
  end
   end
  resources :cart_items do
    collection do
      delete 'destroy_all'
  end
 end

end

  namespace :admin do
    root to: 'homes#top'
    get "homes/about"
    resources :genres
    resources :items
    resources :customers
    resources :order_histories, only: [:show, :update]
    resources :order_details, only:[:update]
    # get '/genres' => 'genres#index'
  end
end
