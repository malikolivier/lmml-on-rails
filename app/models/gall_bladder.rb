# == Schema Information
#
# Table name: gall_bladders
#
#  id                            :integer          not null, primary key
#  internal_liver_examination_id :integer
#  bile_color                    :integer
#  bile_quantity                 :integer
#  gallstones_quantity           :integer
#  gallstones_color              :integer
#  gallstones_size               :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class GallBladder < ApplicationRecord
  belongs_to :internal_liver_examination, required: true

  enum bile_color: %i[dark_green yellowish brown], _prefix: 'bile'
  enum bile_quantity: Settings.enums.five_scale_mass_quantity, _prefix: 'bile'
  enum gallstones_quantity: Settings.enums.five_scale_quantity,
       _prefix: 'gallstones'
  enum gallstones_color: %i[yellow yellow_green green brown],
       _prefix: 'gallstones'
  enum gallstones_size: Settings.enums.size,
       _prefix: 'gallstones'
end
