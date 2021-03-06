class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #It's not a good solution to solve the problem about ransack
  #before_action :declare_ransack


  def admin_required
	  # redirect_to root_path if !current_user.role?(:admin)
    # redirect_to root_path unless current_user.is_seller_or_admin?
    redirect_to root_path unless current_user.is_admin?
  end


  def seller_required
    redirect_to root_path unless current_user.is_seller?
  end

  def seller_or_admin_required
    redirect_to root_path unless current_user.is_seller_or_admin?
  end

  helper_method :current_cart

  def current_cart
  	@current_cart ||= find_cart
  end

  def find_cart
  	cart = Cart.find_by(:id => session[:cart_id])

  	unless cart.present?
  		cart = Cart.create
  	end

  	session[:cart_id] = cart.id
  	cart
  end

# move declartion to view
#  private 
#    def declare_ransack
#      @q = Product.ransack(params[:q])
#    end


end
