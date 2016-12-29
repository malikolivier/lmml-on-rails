# == Schema Information
#
# Table name: drugs
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Drug < ApplicationRecord
  def translated_name
    I18n.t "drugs.#{name}"
  end
end
