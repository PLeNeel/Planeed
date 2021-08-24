class ServicesController < ApplicationController
  def show
    @service = Service.find(:id)
  end
end
