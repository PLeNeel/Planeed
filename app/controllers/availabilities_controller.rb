class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availabilitie.where(user_id: current_user.id)
    @availabilitie = Availabilitie.new
  end

  def create
    @availabilitie = Availabilitie.new(availabilitie_params)
    @user = User.find(:user_id)
    @availabilitie.user = @user
    raise
    if @availabilitie.save
      redirect_to availabilities_path
    else
      render new
    end
  end

  private

  def availability_params
    params.require(:availabilitie).permit(:date, :user_id)
  end
end
