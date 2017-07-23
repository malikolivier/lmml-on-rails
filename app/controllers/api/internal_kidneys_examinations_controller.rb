class Api::InternalKidneysExaminationsController < Api::DualExaminationsController
  private

   def update_params
     params.require(:internal_kidneys_examination)
           .permit(:deixis, :weight, :hardness, :capsule_removal,
                   :capsule_congestion, :pelvis_congestion, :pelvis_petechia,
                   examination_attributes: [:note])
   end
end
