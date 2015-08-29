class ContractsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @user = current_user
    @item = Item.find(params[:item_id])
    @contract = Contract.new
  end

  def show
    @contract = Contract.find(params[:id])
    if (@contract.renter_id == current_user.id) || (@contract.owner_id == current_user.id)
    else
      redirect_to items_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @contract = Contract.new(contract_params)
    @contract.owner_id = @item.user_id
    if @contract.save
      redirect_to user_item_contract_path(@contract.owner_id, @contract.item_id, @contract.id)
    else
      render :new
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:start_date, :end_date, :owner_id, :renter_id, :item_id).merge(item_id: params[:item_id], renter_id: current_user.id)
  end

end
