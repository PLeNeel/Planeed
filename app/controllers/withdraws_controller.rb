class WithdrawsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @withdraw = Withdraw.new
  end

  def create
    @withdraw = Withdraw.new(withdraw_params)
    @user = current_user
    # @toxic = Toxic.find(:toxic_id)
    @withdraw.user = @user
    # @withdraw.toxic_id = @toxic
    @withdraw.save!
    respond_to do |format|
      format.html
      format.json { render json: @withdraw }
    end
  end

  private

  def withdraw_params
    params.require(:withdraw).permit(:quantity, :toxic_id, :token, :user_id)
  end
end
