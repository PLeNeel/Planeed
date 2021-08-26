class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.where(user_id: current_user.id)
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)
    @user = User.find(:user_id)
    @availability.user = @user
    if @availability.save
      redirect_to availabilities_path
    else
      render new
    end
  end

  private

  def availability_params
    params.require(:availability).permit(:date, :user_id)
  end
end
