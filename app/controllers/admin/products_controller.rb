class Admin::ProductsController < AdminController

	before_action :find_product, :only => [:show, :edit, :update, :destroy]


	def index
		#@products = Product.order("created_at DESC").paginate(:page => params[:page], :per_page=>20)
		if current_user.is_admin?
			@products = Product.order("created_at DESC").paginate(:page => params[:page], :per_page=>20)
		else
			@products = current_user.store.products.order("created_at DESC").paginate(:page => params[:page], :per_page=>20)
		end
		
		#@store = current_user.store
	end

	def show
		@photos = @product.photos
	end

	def new
		store = current_user.store
		@product = store.products.build
		#@product = Product.new
		#@product.photos.build
	end

	def create
		store = current_user.store
		@product = store.products.build(product_params)
		#@product = Product.new(product_params)

		if @product.save
			redirect_to admin_my_store_path
		else
			render :new
		end	
	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to admin_products_path
		else
			render :edit
		end

	end

	def destroy
		if @product.destroy
			redirect_to admin_products_path
		end
	end



	private

	def find_product
		if current_user.is_admin?
			@product = Product.find(params[:id])
		else
			@product = curretn_user.store.products.find(params[:id])
		end
		
	end

	def product_params
		params.require(:product).permit(:title, :description, :quantity, :price, :photos_attributes => [:id, :image, :_destroy])
	end


end
