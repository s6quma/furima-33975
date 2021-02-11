class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @purchase_history_address = PurchaseHistoryAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_address_params)
    @item = Item.find(params[:item_id])
    if @purchase_history_address.valid?
      @purchase_history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_history_address_params
    params.require(:purchase_history_address).permit(:postal_code, :prefecture, :city, :block_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
