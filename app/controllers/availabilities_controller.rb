class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.where(user_id: current_user.id)
  end
end
