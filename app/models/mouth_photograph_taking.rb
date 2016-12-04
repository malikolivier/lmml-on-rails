# == Schema Information
#
# Table name: mouth_photograph_takings
#
#  id                            :integer          not null, primary key
#  external_mouth_examination_id :integer          not null
#  photograph_id                 :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class MouthPhotographTaking < ApplicationRecord
end
