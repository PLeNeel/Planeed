class ToxicsController < ApplicationController
  def index
    @toxics = Toxic.where(service_id: toxic.service.id)
  end
end
