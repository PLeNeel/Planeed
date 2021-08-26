class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availabilitie.where(user_id: current_user.id)
    @Availabilitie = Availabilitie.new
  end

  # def new
  #   @Availabilitie = Availabilitie.new
  # end

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

  def availabilitie_params
    params.require(:availabilitie).permit(:date, :user_id)
  end
end

# find or create method
