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

class Autopsy < ApplicationRecord
  include Filterable

  scope :number, ->(number) { where('autopsies.number LIKE ?', "%#{number}") }
  scope :examiner_filter, lambda { |examiner_filter|
    like_examiner = '%' + examiner_filter + '%'
    joins(:examiner)
      .where(examiner_id: examiner_filter)
      .or(joins(:examiner).where('people.name LIKE ?', like_examiner))
  }
  scope :police_inspector_filter, lambda { |police_inspector_filter|
    like_inspector = '%' + police_inspector_filter + '%'
    joins(:police_inspector)
      .where(police_inspector_id: police_inspector_filter)
      .or(joins(:police_inspector).where('people.name LIKE ?', like_inspector))
  }

  belongs_to :autopsy_type
  # rubocop:disable Metrics/LineLength
  belongs_to :examiner, class_name: 'Person', counter_cache: :autopsies_examiners_count
  belongs_to :suspect, class_name: 'Person', counter_cache: :autopsies_suspects_count
  belongs_to :victim, class_name: 'Person', counter_cache: :autopsies_victims_count
  belongs_to :police_inspector, class_name: 'Person', counter_cache: :autopsies_police_inspectors_count
  belongs_to :judge, class_name: 'Person', counter_cache: :autopsies_judges_count
  belongs_to :place, class_name: 'Institution', counter_cache: :autopsies_places_count
  belongs_to :police_station, class_name: 'Institution', counter_cache: :autopsies_police_stations_count
  belongs_to :court, class_name: 'Institution', counter_cache: :autopsies_courts_count
  # rubocop:enable Metrics/LineLength

  has_many :participations
  has_many :participants, through: :participations, source: :person
  has_many :conclusions
  has_many :explanations
  has_many :examinations
  has_many :analyses
  has_many :analysis_others
  has_many :autopsy_photograph_takings
  has_many :photographs, through: :autopsy_photograph_takings

  before_create :setup_new_autopsy
  after_create :create_examinations!

  def victim_name
    victim.name if victim.present?
  end

  def suspect_name
    suspect.name if suspect.present?
  end

  accepts_nested_attributes_for :suspect, :victim, :place, :examiner,
                                :police_inspector, :judge, :police_station,
                                :court, :participations,
                                reject_if: :all_blank

  def examination(examination_type)
    examinations.find_by(examination_types: { id: examination_type.id }) ||
      Examination.new(examination_type: examination_type, autopsy: self)
  end

  def analysis(analysis_type)
    analyses.find_by(analysis_types: { id: analysis_type.id }) ||
      Analysis.new(analysis_type: analysis_type)
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

  # For reasons I do not understand, the following helper throws an error saying
  # that the method "participations_attributes[]" does not exist (used in
  # autopsy form).
  #    hidden_field :autopsy, 'participations_attributes[]'
  # The method is completetely useless, however to avoid errors to be thrown I
  # defined an empty method with this name.
  define_method 'participations_attributes[]', -> {}

  private

  def setup_new_autopsy
    self.court ||= judge.institution if judge.present?
    return if police_inspector.blank?
    self.police_station ||= police_inspector.institution
  end

  def create_examinations!
    ExaminationType.find_each do |examination_type|
      examination(examination_type).save!
    end
  end
end
