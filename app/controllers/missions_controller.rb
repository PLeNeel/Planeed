class MissionsController < ApplicationController

  def index
    @missions = Mission.all
    if params[:availability_id].nil?
      missions_from_dashboard
    else
      availability_date = Availability.find(params[:availability_id]).date
      @missions = Mission.where(date: availability_date)
    end
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.service = Service.find(current_user.service_id)
    if @mission.save
      redirect_to root_path
    else
      render :new
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

  def mission_params
    params.require(:mission).permit(:service_id, :date, :description)
  end
end
