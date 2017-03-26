# Container to store a dual examination (like the two lungs)
class DualExamination
  attr_reader :exams, :model
  delegate :each, to: :exams
  delegate :group_by, to: :exams
  delegate :name, to: :model

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
    @model = model_class
    @autopsy = autopsy
    @examination_type = ExaminationType.by_name(examination_name, examination_category)
    @exams = [:left, :right].map do |deixis|
      model_class.joins(:examination)
                 .find_by(
                   deixis: deixis,
                   examinations:
                     { autopsy_id: autopsy.id }
                 )
    end
  end

  def update(params = {})
    raise 'Expected "deixis" to be set to "left" of "right"' if params[:deixis].blank?
    object = send(params[:deixis]).take
    if object.present?
      object.update(params)
    else
      params[:examination] = Examination.create!(
        autopsy: @autopsy,
        examination_type: @examination_type
      )
      send("#{params[:deixis]}=", @model.create!(params))
    end
  end

  def errors
    full_messages = []
    [:left, :right].each do |deixis|
      obj = send(deixis).take
      next if obj.try(:errors).blank?
      full_messages.push("#{deixis.capitalize}: #{obj.errors.full_messages}")
    end
    DualExaminationError.new(full_messages) if full_messages.any?
  end

  def examination_category
    name.underscore.split('_')[0]
  end

  def examination_name
    name.underscore.match(/^[a-z]+_(.+)_examination$/)[1]
  end

  private

  def left=(object)
    @exams[0] = object
  end

  def right=(object)
    @exams[1] = object
  end

  class DualExaminationFalseRelation
    def initialize(object)
      @object = object
    end

    def take
      @object
    end
  end

  class DualExaminationError
    attr_reader :full_messages
    def initialize(full_messages)
      @full_messages = full_messages.join("\n")
    end
  end
end
