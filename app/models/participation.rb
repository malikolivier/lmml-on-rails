# == Schema Information
#
# Table name: participations
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  autopsy_id :integer
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participation < ApplicationRecord
  belongs_to :person
  belongs_to :autopsy, required: true
  enum role: %i[examiner requester authorizer writer assistant student
                spectator]

  includes_in_json person: Person.as_lmml_params
end
