class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @stores = Store.approved.order(id: :desc)
  end

  def show
    @store = Store.approved.find(params[:id])
  end

  def new
    @store = current_user.build_store
  end

  def create
    @store = current_user.build_store(store_params)

    if @store.save
      current_user.udpate_role!(:seller)
      flash[:notice] = "我們已收到您的開店資訊，我們會儘速審核，謝謝！"
      redirect_to root_path
    else
      flash[:error] = "Something wrong"
      render :new
    end
  end


  private

  def store_params
    params.require(:store).permit(:name, :introduction, :image, :bank_account)
  end

end
