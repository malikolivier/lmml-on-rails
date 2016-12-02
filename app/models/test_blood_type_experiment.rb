# == Schema Information
#
# Table name: test_blood_type_experiments
#
#  id         :integer          not null, primary key
#  serum      :text
#  reaction   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TestBloodTypeExperiment < ApplicationRecord
end
