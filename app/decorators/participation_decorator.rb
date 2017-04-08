class ParticipationDecorator < ApplicationDecorator
  decorates_association :person

  def description_chunk
    if object.role.name == 'Spectator'
      t('.spectator', person: person.full_name_with_title)
    elsif object.role.name == 'Assistant'
      t('.assitant', person: person.full_name_with_title)
    end
  end
end
