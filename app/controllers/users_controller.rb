class UsersController < ApplicationController

  def show
    @user = User.find(current_user)
    @ownerContracts = Contract.where(owner_id: @user.id)
    @renterContracts = Contract.where(renter_id: @user.id)
  end

end
