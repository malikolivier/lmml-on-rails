# == Schema Information
#
# Table name: photographs
#
#  id                   :integer          not null, primary key
#  caption              :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Photograph < ApplicationRecord
  has_attached_file :picture

  validates_attachment_content_type :picture, content_type: %r{\Aimage/.*\z}

  after_destroy :destroy_relationships

  private

  def destroy_relationships
    InjuryPhotographTaking.where(photograph: self).destroy_all
  end
end
