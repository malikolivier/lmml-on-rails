class ExaminationsController < ApplicationController
  before_action :set_exam, only: %i[update edit]
  decorates_assigned :exam, :examination_type

  # GET /autopsies/:id/***_examinations/edit
  def edit; end

  # GET /autopsies/:id/***_examinations/new
  def new
    examination_type = ExaminationType.by_name(examination_name,
                                               examination_category)
    @exam_base = Examination.new(examination_type: examination_type)
  end

  private

  def examination_category
    controller_name.split('_')[0]
  end

  def examination_name
    controller_name.match(/^[a-z]+_(.+)_examinations$/)[1]
  end

  def set_exam # rubocop:disable MethodLength, AbcSize # TODO
    exam_params = params[controller_name.singularize]
    if exam_params.present? && exam_params[:id].present?
      @exam = model_class.find(exam_params[:id])
      exam_params.delete(:id)
    else
      autopsy = Autopsy.find(params[:id])
      @exam = model_class.joins(:examination)
                         .find_by(
                           examinations:
                             { autopsy_id: autopsy.id }
                         )
      @exam ||= new_examination
    end
    ActiveRecord::Associations::Preloader.new.preload(@exam, :examination)
    @examination_type = ExaminationType.by_name(examination_name,
                                                examination_category)
  end

  def new_examination
    autopsy = Autopsy.find(params[:id])
    model_class.new(
      examination: Examination.create!(
        autopsy: autopsy,
        examination_type: ExaminationType
          .by_name(examination_name, examination_category)
      )
    )
  end
end
