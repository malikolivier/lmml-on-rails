class ExternalOutlineExaminationsController < ApplicationController
  protect_from_forgery except: [:create, :update]
  before_action :set_exam, only: [:create, :update]

  # PUT /autopsies/:autopsy_id/external_outline_examinations.json
  def update
    if @exam.update(update_params)
      render 'autopsies/external/_outline', locals: { exam: @exam }
    else
      render json: { errors: @exam.errors.full_messages }, status: 422
    end
  end

  private

  def set_exam
    exam_params = params[:external_outline_examination]
    if exam_params.present? && exam_params[:id].present?
      @exam = ExternalOutlineExamination.find(exam_params[:id])
      exam_params.delete(:id)
    else
      autopsy = Autopsy.find(params[:autopsy_id])
      @exam = ExternalOutlineExamination.joins(:examination)
                                        .find_by(
                                          examinations:
                                            { autopsy_id: autopsy.id }
                                        )
      @exam ||= ExternalOutlineExamination.new(
        examination: Examination.create!(autopsy: autopsy,
                                         examination_type: ExaminationType
                                           .by_name(:outline, :external))
      )
    end
    ActiveRecord::Associations::Preloader.new.preload(@exam, :examination)
  end

  def update_params
    params.require(:external_outline_examination)
          .permit(:id, :sex, :partial_body, :height, :weight, :constitution)
  end
end
