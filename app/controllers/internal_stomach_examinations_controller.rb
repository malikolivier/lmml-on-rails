class InternalStomachExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:internal_stomach_examination)
          .permit(:content_color, :content_smell, :content_aspect,
                  :content_quantity, :content_quantity, :content_digestion,
                  :rugae, examination_attributes: [:note])
  end
end
