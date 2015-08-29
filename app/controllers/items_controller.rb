class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @user = current_user
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :condition, :brand, :date_purchased, :user_id).merge(user_id: params[:user_id])
  end
end
