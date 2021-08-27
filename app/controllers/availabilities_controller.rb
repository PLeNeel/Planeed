class AvailabilitiesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @availabilities = Availability.where(user_id: current_user.id)
    @availability = Availability.new
  end

  def create
    # @avai = Availability.where()
    @availability = Availability.new(availability_params)
    @availability.user = current_user
    if @availability.save
      render json: @availability
      # redirect_to availabilities_path
    else
      render new
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy
  end

  private

  def availability_params
    params.require(:availability).permit(:date, :user_id)
  end
end
