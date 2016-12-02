# == Schema Information
#
# Table name: test_triage_drugs
#
#  id            :integer          not null, primary key
#  concentration :float
#  reaction      :integer
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TestTriageDrug < ApplicationRecord
end
