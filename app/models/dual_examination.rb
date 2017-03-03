# Container to store a dual examination (like the two lungs)
class DualExamination
  attr_reader :exams
  delegate :each, to: :exams

  def left
    DualExaminationFalseRelation.new(@exams[0])
  end

  def right
    DualExaminationFalseRelation.new(@exams[1])
  end

  def first
    @exams[0] || @exams[1]
  end

  # model_class is an instance of DualExaminationBase
  # autopsy is an instance of Autopsy
  # finds the dual examination for the specified class in the specified autopsy
  def initialize(model_class, autopsy)
    @exams = [:left, :right].map do |deixis|
      model_class.joins(:examination)
                 .find_by(
                   deixis: deixis,
                   examinations:
                     { autopsy_id: autopsy.id }
                 )
    end
  end

  class DualExaminationFalseRelation
    def initialize(object)
      @object = object
    end

    def take
      @object
    end
  end
end
