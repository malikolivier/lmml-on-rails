# == Schema Information
#
# Table name: people
#
#  id                    :integer          not null, primary key
#  name                  :text
#  sex                   :integer
#  age                   :integer
#  title                 :text
#  institution_id        :integer
#  identification_number :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Person < ApplicationRecord
    belongs_to :institution

    enum sex: [:M, :F, :O]
end
