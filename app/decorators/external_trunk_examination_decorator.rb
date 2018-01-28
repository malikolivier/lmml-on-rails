class ExternalTrunkExaminationDecorator < ExaminationBaseDecorator
  def discoloration_description
    if object.discolored?
      t('.discoloration')
    elsif object.no_discoloration?
      t('.no_discoloration')
    end
  end
end
