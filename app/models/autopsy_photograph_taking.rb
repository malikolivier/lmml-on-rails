# == Schema Information
#
# Table name: autopsy_photograph_takings
#
#  id            :integer          not null, primary key
#  category      :integer
#  autopsy_id    :integer
#  photograph_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class AutopsyPhotographTaking < ApplicationRecord
  default_scope -> { order(:category) }

  enum category: %i[front back face other]

  belongs_to :autopsy
  belongs_to :photograph

  validates :category, presence: true

  after_destroy :destroy_photograph

  includes_in_json :photograph

  accepts_nested_attributes_for :photograph, reject_if: :all_blank

  private

  def destroy_photograph
    photograph.destroy if photograph.present?
  end
end
