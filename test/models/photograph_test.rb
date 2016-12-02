# == Schema Information
#
# Table name: photographs
#
#  id                   :integer          not null, primary key
#  type                 :integer
#  caption              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

require 'test_helper'

class PhotographTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
