class Admin::StoresController < AdminController
  before_action :admin_required

  def index
    @stores = Store.order(id: :desc)
  end

  def approve
    @store = Store.find(params[:id])
    @store.update_columns(approved: true)
    redirect_to admin_stores_path
  end

end