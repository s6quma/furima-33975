class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @purchase_history_address = PurchaseHistoryAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_address_params)
    @item = Item.find(params[:item_id])
    if @purchase_history_address.valid?
      pay_item
      @purchase_history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_address_params
    params.require(:purchase_history_address).permit(:postal_code, :prefecture, :city, :block_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_history_address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase_history != nil || @item.user_id == current_user.id
  end
end
