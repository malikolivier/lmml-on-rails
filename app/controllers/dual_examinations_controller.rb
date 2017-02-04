class DualExaminationsController < ExaminationsController
  protected

  def set_exam
    autopsy = Autopsy.find(params[:autopsy_id])
    @exam = model_class.joins(:examination)
                       .where(
                         examinations:
                           { autopsy_id: autopsy.id }
                       )
    if @exam.length != 2
      [:left, :right].each do |deixis|
        next if @exam.any?(&"#{deixis}?".to_sym)
        new_exam = model_class.new(
          examination: Examination.create!(
            autopsy: autopsy,
            examination_type: ExaminationType
              .by_name(examination_name, examination_category)
          ),
          deixis: :deixis
        )
        @exam.push(new_exam)
      end
    end
    ActiveRecord::Associations::Preloader
      .new.preload(@exam, examination: :examination_type)
    @exam_base = @exam[0].examination
  end
end
