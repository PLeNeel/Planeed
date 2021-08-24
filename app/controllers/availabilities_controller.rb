class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availabilitie.where(user_id: current_user.id)
  end
end
