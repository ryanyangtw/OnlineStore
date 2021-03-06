Rails.application.routes.draw do

  #add for sidekiq dashboard
  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"

  devise_for :users
  namespace :admin do
    resources :stores, only: :index do
      member do
        post :approve
      end
    end
    get "my_store", to: "products#index"
    resources :products do
      resources :photos
    end
    resources :orders do
       member do 
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  resources :products do
    collection do
      #post :search, :to => "products#index"  
      post :search
    end
  end

  resources :carts do
    collection do
      delete :remove_all
      post :checkout
    end
  end

  resources :orders do
    member do
      get :pay_with_credit_card
    end
    resources :card_charges
  end

  resources :cart_items do
    member do
      post :add_to_cart
      delete :remove_from_cart
    end
  end

  namespace :account do
    resources :orders do
      member do
        post :cancel
        post :return
      end
    end
  end

  resources :stores, only: [:index, :show, :new, :create]

  # root :to => "products#index"
  root to: "stores#index"

  mount API::Root => '/'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
