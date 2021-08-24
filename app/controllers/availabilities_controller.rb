class AvailabilitiesController < ApplicationController
  def index
    @availability = Availabilitie.where(user_id: current_user.id)
  end
end
