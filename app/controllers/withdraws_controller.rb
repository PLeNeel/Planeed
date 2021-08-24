class WithdrawsController < ApplicationController
  def new
    @withdraw = Withdraw.new
  end

  def create
    @withdraw = Withdraw.new(withdraw_params)
    @user = User.find(:user_id)
    @toxic = Toxic.find(:toxic_id)
    @withdraw.user_id = @user
    @withdraw.toxic_id = @toxic
    @withdraw.save
    if @withdraw.save
      redirect_to toxics_path(@withdraw)
    else
      render new
    end
  end

  private

  def withdraw_params
    params.require(:withdraw).permit(:quantity, :toxic_id, :token, :user_id)
  end
end
