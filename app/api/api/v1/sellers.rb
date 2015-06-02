module API
  module V1
    class Sellers < Grape::API

      resources :users do
        desc "Get order for specific seller"
          get "/:id/seller_orders" do
        end
      end
      
    end
  end
end