class ExaminationNestedModelsController < ApplicationController
  before_action :set_nested_model, only: [:destroy]

  def create
    @nested_model = model_class.create!(create_params)
  end

  def destroy
    @nested_model.destroy!
  end

  private

  def set_nested_model
    @nested_model = model_class.find(params[:id])
  end
end
