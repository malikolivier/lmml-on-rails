class ParticipationDecorator < ApplicationDecorator
  decorates_association :person

  def description_chunk
    return '' if person.blank?
    if object.spectator?
      t('.spectator', person: person.full_name_with_title)
    elsif object.assistant?
      t('.assitant', person: person.full_name_with_title)
    end
  end
end
