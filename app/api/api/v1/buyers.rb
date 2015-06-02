module API
  module V1
    class Buyers < Grape::API

      @@default_buyers_path = 'v1/buyers'
      @@default_orders_path = 'v1/orders'

      resources :users do
        desc "Create User"        
        params do
          requires :user, type: Hash do
            requires :email, type: String
            requires :password, type: String
          end
        end
        post "/sign_up" do

          #@user = User.new({email: params[:email], password: params[:password]})
          #puts "============================================================="
          #puts params
          #puts "============================================================="
          #puts params[:user]
          #puts "============================================================="
          @user = User.new(params[:user])
          if(@user.save)

            render rabl: "#{@@default_buyers_path}/show"
          else
            #raise
            error!(@user.errors.full_messages)
            #error_response({ message: "rescued from" })
            #error!("該使用者已經存在", 500)
          end
        end

        desc "User Sign in"
        params do
          optional :user, type: Hash do
            optional :email, type: String , documentation: { example: '123@gmail.com' }
            optional :password, type: String
          end
        end
        namespace :sign_in do
          post do
            
            @user = User.find_by(email: params[:user][:email])
            if(@user && @user.valid_password?(params[:user][:password]))

              render rabl: "#{@@default_buyers_path}/show"
            else
              error!(@user.errors.full_messages)
              #error!("401 Unauthorized", 401)
            end
          end
        end


        desc "Get order for specific buyer"
        get "/:id/buyer_orders" do
          user = User.find(params[:id])
          @orders = user.orders.recent
          render rabl: "#{@@default_orders_path}/index"
        end



      end # end of resources :users 

    end
  end
end