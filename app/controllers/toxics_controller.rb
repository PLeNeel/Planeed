class ToxicsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @service = Service.find(params[:service_id])
    @toxics = Toxic.where(service_id: params[:service_id])
  end

  # def update
  #   @toxic = Toxic.find(params[:id])
  #   @toxic.update!(toxic_params)
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: @toxic }
  #   end
  # end

  private

  def toxic_params
    params.require(:toxic).permit(:service_id, :name, :total_quantity, :current_quantity)
  end
end
