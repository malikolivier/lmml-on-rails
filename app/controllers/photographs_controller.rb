class PhotographsController < ApplicationController
  before_action :set_photograph, only: :destroy

  def destroy
    @photograph.destroy!
  end

  private

  def set_photograph
    @photograph = Photograph.find(params[:id])
  end
end
