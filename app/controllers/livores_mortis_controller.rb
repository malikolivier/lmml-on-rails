class LivoresMortisController < ApplicationController
  before_action :set_livor_mortis, only: [:destroy]

  def create
    @livor_mortis = LivorMortis.create!(create_params)
  end

  def destroy
    @livor_mortis.destroy!
  end

  private

  def set_livor_mortis
    @livor_mortis = LivorMortis.find(params[:id])
  end

  def create_params
    params.require(:livor_mortis)
          .permit(:external_outline_examination_id)
  end
end
