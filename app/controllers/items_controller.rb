class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

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

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
