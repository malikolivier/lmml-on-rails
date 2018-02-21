class PersonDecorator < ApplicationDecorator
  delegate :name

  def full_name_with_title(position = '')
    t('.full_name_with_title', institution_name: institution_name,
                               position: position, name: name,
                               title: model.title)
  end

  def death_information
    t('.death_information', name: name, age: death_age_information)
  end

  def institution_name
    model.institution&.name
  end

  private

  def death_age_information
    return '' if model.death_age.blank?
    t('.death_age_information', age: model.death_age)
  end
end
