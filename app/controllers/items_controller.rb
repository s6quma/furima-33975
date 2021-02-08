class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item =Item.new
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:title, :description, :price, :category_id, :condition_id, :shipping_charge_id, :area_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
