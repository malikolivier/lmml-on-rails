class DualExaminationBaseDecorator < ApplicationDecorator
  def translated_deixis
    model.translated_enum_value(:deixis)
  end
end
