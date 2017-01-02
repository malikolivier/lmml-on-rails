# == Schema Information
#
# Table name: people
#
#  id                               :integer          not null, primary key
#  name                             :text
#  sex                              :integer
#  death_age                        :integer
#  dob                              :date
#  title                            :text
#  institution_id                   :integer
#  identification_number            :text
#  autopsies_examiner_count         :integer          default(0)
#  autopsies_suspect_count          :integer          default(0)
#  autopsies_victim_count           :integer          default(0)
#  autopsies_police_inspector_count :integer          default(0)
#  autopsies_judge_count            :integer          default(0)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#

class Person < ApplicationRecord
  belongs_to :institution

  enum sex: Settings.enums.sex

  def full_name_with_title(position = '')
    "#{institution_name}#{position}・#{name}#{title}"
  end

  def institution_name
    institution.name unless institution.blank?
  end

  scope :been_examiner, lambda {
    where('autopsies_examiner_count > 0')
      .order(autopsies_examiner_count: :desc)
  }
  scope :been_judge, lambda {
    where('autopsies_judge_count > 0')
      .order(autopsies_judge_count: :desc)
  }
  scope :been_police_inspector, lambda {
    where('autopsies_police_inspector_count > 0')
      .order(autopsies_police_inspector_count: :desc)
  }
end
