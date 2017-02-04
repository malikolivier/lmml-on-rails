class DualExaminationsController < ExaminationsController
  protected

  def set_exam
    autopsy = Autopsy.find(params[:autopsy_id])
    @exam = model_class.joins(:examination)
                       .where(
                         examinations:
                           { autopsy_id: autopsy.id }
                       )
    ActiveRecord::Associations::Preloader
      .new.preload(@exam, examination: :examination_type)
    @exam_base = @exam.any? ? @exam[0].examination : nil
    if @exam.length != 2
      @exam = @exam.to_a
      [:left, :right].each do |deixis|
        # TODO All of this is buggy
        next if @exam.any?(&"#{deixis}?".to_sym)
        binding.pry
        new_exam = model_class.new(
          examination: Examination.create!(
            autopsy: autopsy,
            examination_type: ExaminationType
              .by_name(examination_name, examination_category)
          ),
          deixis: deixis
        )
        @exam.push(new_exam)
      end
    end
  end
end
