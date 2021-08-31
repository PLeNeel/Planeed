class WithdrawsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @withdraw = Withdraw.new
  end

  def create
    @toxic = Toxic.find(params[:toxic_id])
    if @toxic.total_quantity == @toxic.current_quantity
      brand_new_minus_action
    elsif @toxic.current_quantity.zero?
      render "toxics"
    else
      update_minus_action
    end
  end

  private

  def brand_new_minus_action
    @toxic.update(current_quantity: params[:current_quantity])
    @withdraw = Withdraw.new(withdraw_params)
    @withdraw.user = current_user
    @withdraw.toxic = @toxic
    @withdraw.save
    respond_to do |format|
      format.html
      # format.json { render json: @withdraw }
      format.json { render json: { withdraw: @withdraw, toxic: @toxic } }
    end
  end

  def update_minus_action
    @toxic.update(current_quantity: params[:current_quantity])
    @withdraw = Withdraw.find(params[:withdraw_id])
    add_or_withdraw(operator)
    puts "nouvelle quantité #{@withdraw.quantity}"
    @withdraw.update(quantity: new_quantity)
    respond_to do |format|
      format.html
      # format.json { render json: @withdraw }
      format.json { render json: { withdraw: @withdraw, toxic: @toxic } }
    end
  end

  def add_or_withdraw(operator)
    @withdraw = Withdraw.find(params[:withdraw_id])
    new_quantity = @withdraw.quantity
    if operator == "minus"
      new_quantity += 1
    else
      new_quantity -= 1
    end
    new_quantity
  end

  def withdraw_params
    params.require(:withdraw).permit(:quantity, :toxic_id, :token, :user_id)
  end
end
