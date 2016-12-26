# == Schema Information
#
# Table name: autopsies
#
#  id                  :integer          not null, primary key
#  completed           :boolean          default(FALSE)
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
  belongs_to :autopsy_type
  belongs_to :examiner, class_name: Person
  belongs_to :suspect, class_name: Person
  belongs_to :victim, class_name: Person
  belongs_to :police_inspector, class_name: Person
  belongs_to :judge, class_name: Person
  belongs_to :place, class_name: Institution
  belongs_to :police_station, class_name: Institution
  belongs_to :court, class_name: Institution

  has_many :participations
  has_many :participants, through: :participations, source: :person
  has_many :conclusions
  has_many :explanations
  has_many :examinations, lambda {
    joins(:examination_type).order('`examination_types`.`placement`')
  }
  has_many :analyses, lambda {
    joins(:analysis_type).order('`analysis_types`.`placement`')
  }
  has_many :autopsy_photograph_takings
  has_many :photographs, through: :autopsy_photograph_takings

  def ordered_analyses
    analyses = Analysis.find_by_sql("SELECT `analyses`.*,
                                 `analysis_types`.`placement`,
                                  0 AS '`analysis_others`.`placement`'
                          FROM `analyses`
                          INNER JOIN `analysis_types` ON `analysis_types`.`id` = `analyses`.`analysis_type_id`
                          WHERE `analysis_types`.`name` != 'other'
                          UNION
                          SELECT `analyses`.*,
                                `analysis_types`.`placement`,
                                `analysis_others`.`placement`
                          FROM `analyses`
                          INNER JOIN `analysis_types` ON `analysis_types`.`id` = `analyses`.`analysis_type_id`
                          INNER JOIN `analysis_others` ON `analysis_others`.`analysis_id` = `analyses`.`id`
                          WHERE `analysis_types`.`name` = 'other'
                          ORDER BY `analysis_types`.`placement`, `analysis_others`.`placement`;")
    ActiveRecord::Associations::Preloader.new.preload(analyses, :analysis_type)
    analyses
  end
end
