# == Schema Information
#
# Table name: people
#
#  id                    :integer          not null, primary key
#  name                  :text
#  sex                   :text
#  age                   :integer
#  title                 :text
#  institution_id        :integer
#  identification_number :text
#  role_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
