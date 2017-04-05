# == Schema Information
#
# Table name: people
#
#  id                                :integer          not null, primary key
#  name                              :text
#  sex                               :integer
#  death_age                         :integer
#  dob                               :date
#  title                             :text
#  affiliation                       :text
#  institution_id                    :integer
#  identification_number             :text
#  autopsies_examiners_count         :integer          default(0)
#  autopsies_suspects_count          :integer          default(0)
#  autopsies_victims_count           :integer          default(0)
#  autopsies_police_inspectors_count :integer          default(0)
#  autopsies_judges_count            :integer          default(0)
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#

class Person < ApplicationRecord
  belongs_to :institution

  includes_in_json institution: Institution.as_lmml_params
  VICTIM_JSON_EXCEPT_KEYS = %i(death_age autopsies_examiners_count
                               autopsies_suspects_count autopsies_victims_count
                               autopsies_police_inspectors_count
                               autopsies_judges_count).freeze
  JSON_EXCEPT_KEYS = (VICTIM_JSON_EXCEPT_KEYS.dup << :death_age).freeze
  JSON_KEYS = { except: JSON_EXCEPT_KEYS, include: json_includes }.freeze
  VICTIM_JSON_KEYS = { except: VICTIM_JSON_EXCEPT_KEYS,
                       include: json_includes }.freeze

  has_many :autopsies_examiners, class_name: Autopsy, foreign_key: :examiner_id
  has_many :autopsies_suspects, class_name: Autopsy, foreign_key: :suspect_id
  has_many :autopsies_victims, class_name: Autopsy, foreign_key: :victim_id
  has_many :autopsies_police_inspectors, class_name: Autopsy,
                                         foreign_key: :police_inspector_id
  has_many :autopsies_judges, class_name: Autopsy, foreign_key: :judge_id

  enum sex: Settings.enums.sex

  def full_name_with_title(position = '')
    "#{institution_name}#{position}・#{name}#{title}"
  end

  def institution_name
    institution.name if institution.present?
  end

  scope :been_examiner, lambda {
    where('autopsies_examiners_count > 0')
      .order(autopsies_examiners_count: :desc)
  }
  scope :been_judge, lambda {
    where('autopsies_judges_count > 0')
      .order(autopsies_judges_count: :desc)
  }
  scope :been_police_inspector, lambda {
    where('autopsies_police_inspectors_count > 0')
      .order(autopsies_police_inspectors_count: :desc)
  }
end
