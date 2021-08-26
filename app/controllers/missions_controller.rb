class MissionsController < ApplicationController

  def index
    availability_date = Availabilitie.find(params[:availability_id]).date
    @missions = Mission.where(date: availability_date)
  end
end
