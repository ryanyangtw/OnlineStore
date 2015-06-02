module API
  module V1
    class Stores < Grape::API

      @@default_store_path = 'v1/stores'
      @@default_product_path = 'v1/products'

      resources :stores do
        desc "Get all stores"
        get "/" do
          @stores = Store.order(id: :desc)
          render rabl: "#{@@default_store_path}/index"
        end

        # desc "Get specific store"
        # get "/:id" do
        #   @store = Store.find(params[:id])
        #   render rabl: "#{@@default_store_path}/show"
        # end

        desc "Get Prodects In Specific Store"
        get "/:id/products" do
          store = Store.find(params[:id])
          @products = store.products.order(id: :desc)
          render rabl: "#{@@default_product_path}/index"
        end

      end
      
    end
  end
end