class ExternalOutlineExaminationsController < ApplicationController
  protect_from_forgery except: [:create, :update]
  before_action :set_autopsy, only: [:create, :update]
  before_action :set_exam, only: [:create, :update]

  # POST /autopsies/:autopsy_id/external_outline_examinations.json
  def create
    update
  end

  # PUT /autopsies/:autopsy_id/external_outline_examinations.json
  def update
    render 'autopsies/external/_outline', locals: { exam: @exam }
  end

  private

  def set_autopsy
    @autopsy = Autopsy.find(params[:autopsy_id])
  end

  def set_exam
    @exam = ExternalOutlineExamination.joins(:examination)
                                      .find_by(
                                        examinations:
                                          { autopsy_id: @autopsy.id }
                                      )
    @exam ||= ExternalOutlineExamination.new(
      examination: Examination.new(autopsy: @autopsy)
    )
  end
end
