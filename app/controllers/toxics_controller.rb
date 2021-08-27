class ToxicsController < ApplicationController
  def index
    @service = Service.find(params[:service_id])
    @toxics = Toxic.where(service_id: params[:service_id])
  end
end
