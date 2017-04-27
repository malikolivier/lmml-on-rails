# == Schema Information
#
# Table name: injury_photograph_takings
#
#  id            :integer          not null, primary key
#  injury_id     :integer
#  photograph_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class InjuryPhotographTaking < ApplicationRecord
  belongs_to :injury
  belongs_to :photograph

  after_destroy :destroy_photograph

  private

  def destroy_photograph
    photograph &.destroy!
  end
end
