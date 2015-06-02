module API
  module V1
    class Products < Grape::API

      @@default_product_path = 'v1/products'

      resources :products do
        desc "Get Specific Product"
        get "/:id" do
          @product = Product.find(params[:id])
          render rabl: "#{@@default_product_path}/show"
        end


      end

    end
  end
end