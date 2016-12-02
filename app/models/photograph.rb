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

class Photograph < ApplicationRecord
    has_attached_file :picture
end
