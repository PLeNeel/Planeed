class WithdrawsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @withdraw = Withdraw.new
  end

  def create
    @toxic = Toxic.find(params[:toxic_id])
    @operator = params[:operator]
    if @toxic.total_quantity == @toxic.current_quantity
      brand_new_minus_action(@operator, @toxic)
    elsif @toxic.current_quantity.zero?
      # not working, à checker
      # redirect_to service_toxics_path(@toxic.service_id), notice: "stock épuisé, veuillez contacter le responsable du réapprovisionnement"
    else
      update_action(@operator, @toxic)
    end
  end

  private

  def brand_new_minus_action(operator, toxic)
    add_or_withdraw_toxics(operator, toxic)
    @withdraw = Withdraw.new(withdraw_params)
    @withdraw.user = current_user
    @withdraw.toxic = @toxic
    @withdraw.save
    respond_to do |format|
      format.html
      format.text
      format.json { render partial: "toxics/toxics_btn", locals: {toxic: @toxic, last_withdraw_id: @last_withdraw_id}, formats: [:html] }
    end
  end

  def update_action(operator, toxic)
    add_or_withdraw_toxics(operator, toxic)
    @withdraw = Withdraw.find(params[:withdraw_id])
    new_quantity = add_or_withdraw(operator)
    puts "nouvelle quantité #{@withdraw.quantity}"
    @withdraw.update(quantity: new_quantity)
    respond_to do |format|
      format.html
      format.text
      format.json { render partial: "toxics/toxics_btn", locals: {toxic: @toxic, last_withdraw_id: @last_withdraw_id}, formats: [:html] }
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

  def add_or_withdraw_toxics(operator, toxic)
    new_quantity = toxic.current_quantity
    if operator == "minus"
      new_quantity -= 1
    else
      new_quantity += 1
    end
    toxic.update!(current_quantity: new_quantity)
  end

  def withdraw_params
    params.require(:withdraw).permit(:quantity, :toxic_id, :token, :user_id)
  end
end
