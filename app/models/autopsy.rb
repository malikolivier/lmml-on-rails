# == Schema Information
#
# Table name: autopsies
#
#  id                  :integer          not null, primary key
#  completed           :boolean          default(FALSE)
#  approved            :boolean          default(FALSE)
#  number              :text
#  autopsy_type_id     :integer
#  examiner_id         :integer
#  suspect_id          :integer
#  victim_id           :integer
#  place_id            :integer
#  autopsy_date        :date
#  starting_time       :datetime
#  ending_time         :datetime
#  police_station_id   :integer
#  police_inspector_id :integer
#  court_id            :integer
#  judge_id            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

# rubocop:disable Metrics/LineLength
class Autopsy < ApplicationRecord
  belongs_to :autopsy_type
  belongs_to :examiner, class_name: Person, counter_cache: :autopsies_examiners_count
  belongs_to :suspect, class_name: Person, counter_cache: :autopsies_suspects_count
  belongs_to :victim, class_name: Person, counter_cache: :autopsies_victims_count
  belongs_to :police_inspector, class_name: Person, counter_cache: :autopsies_police_inspectors_count
  belongs_to :judge, class_name: Person, counter_cache: :autopsies_judges_count
  belongs_to :place, class_name: Institution, counter_cache: :autopsies_places_count
  belongs_to :police_station, class_name: Institution, counter_cache: :autopsies_police_stations_count
  belongs_to :court, class_name: Institution, counter_cache: :autopsies_courts_count

  has_many :participations
  has_many :participants, through: :participations, source: :person
  has_many :conclusions
  has_many :explanations
  has_many :examinations
  has_many :analyses
  has_many :autopsy_photograph_takings
  has_many :photographs, through: :autopsy_photograph_takings

  def victim_name
    victim.name if victim.present?
  end

  def suspect_name
    suspect.name if suspect.present?
  end

  accepts_nested_attributes_for :suspect, :victim, :place, :examiner,
                                :police_inspector, :judge, :police_station,
                                :court,
                                reject_if: :all_blank

  def examination(examination_type)
    examinations.find_by(examination_types: { id: examination_type.id }) ||
      Examination.new(examination_type: examination_type)
  end

  includes_in_json :autopsy_type, :place, :conclusions, :explanations,
                   examiner: Person.as_lmml_params,
                   suspect: Person.as_lmml_params,
                   victim: Person.as_lmml_params,
                   place: Institution.as_lmml_params,
                   police_station: Institution.as_lmml_params,
                   police_inspector: Person.as_lmml_params,
                   court: Institution.as_lmml_params,
                   judge: Person.as_lmml_params,
                   participations: Participation.as_lmml_params,
                   examinations: Examination.as_lmml_params,
                   analyses: Analysis.as_lmml_params,
                   autopsy_photograph_takings:
                     AutopsyPhotographTaking.as_lmml_params
end
