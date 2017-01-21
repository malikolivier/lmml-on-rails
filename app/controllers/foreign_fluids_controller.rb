class ForeignFluidsController < ExaminationNestedModelsController
  private

  def create_params
    # Only return the content empty content of foreign_fluid hash.
    # Currently, empty param is enough to create a foreign fluid.
    params[:foreign_fluid].permit
  end
end
