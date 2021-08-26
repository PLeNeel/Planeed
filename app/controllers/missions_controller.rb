class MissionsController < ApplicationController

  def index
    if params[:availability_id].nil?
      missions_from_dashboard
    else
      availability_date = Availability.find(params[:availability_id]).date
      @missions = Mission.where(date: availability_date)
    end
  end

  private

  def missions_from_dashboard
    current_user.availabilities.each do |availability|
      Mission.where(date: availability.date).each do |mission|
        @missions = []
        @missions.push(mission)
      end
    end
  end
end
