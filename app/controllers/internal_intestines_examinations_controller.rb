class InternalIntestinesExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:internal_intestines_examination)
          .permit(:id, :appendix,
                  intestine_sections_attributes: [:id, :category, :color,
                                                  :quantity],
                  examination_attributes: [:note])
  end
end
