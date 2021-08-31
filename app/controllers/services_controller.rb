class ServicesController < ApplicationController
  def show
    @service = Service.find(params[:id])
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(service_params)
    redirect_to service_path(@service)
  end

  private

  def service_params
    params.require(:service).permit(:name, :phone_number, :predominant_disease, :typical_workday, :predominant_drugs)
  end
end
