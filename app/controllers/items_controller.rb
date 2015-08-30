class ItemsController < ApplicationController

  def index
    if params[:category]
      @items = Item.where(category_id: params[:category])
    else
      @items = Item.all
    end
  end

  def new
    @user = current_user
    @categories = Category.all
    @item = Item.new
  end

  def show
    @user = current_user
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    categories = params[:item][:categories].split(',').map{|e| e.to_i}
    categories.each do |cat|
      @item.categories << Category.find(cat)
    end
    if @item.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    if Item.destroy(params[:id])
      redirect_to user_path(current_user)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :condition, :brand, :date_purchased, :user_id, :image).merge(user_id: params[:user_id])
  end
end
