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

class Autopsy < ApplicationRecord # rubocop:disable ClassLength
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
                          AND `analyses`.`autopsy_id` = '#{id}'
                          UNION
                          SELECT `analyses`.*,
                                `analysis_types`.`placement`,
                                `analysis_others`.`placement`
                          FROM `analyses`
                          INNER JOIN `analysis_types` ON `analysis_types`.`id` = `analyses`.`analysis_type_id`
                          INNER JOIN `analysis_others` ON `analysis_others`.`analysis_id` = `analyses`.`id`
                          WHERE `analysis_types`.`name` = 'other'
                          AND `analyses`.`autopsy_id` = '#{id}'
                          ORDER BY `analysis_types`.`placement`, `analysis_others`.`placement`;")
    ActiveRecord::Associations::Preloader.new.preload(analyses, :analysis_type)
    analyses
  end

  def victim_name
    victim.name unless victim.blank?
  end

  def suspect_name
    suspect.name unless suspect.blank?
  end

  def introduction_text
    date_description = autopsy_date.present? ? "#{autopsy_date.to_era('%O%E年%m月%d日')}、" : ''
    if police_inspector.present?
      policeman = "#{police_inspector.full_name_with_title('司法警察員')}は、"
      final_verb = 'した'
    else
      policeman = ''
      final_verb = 'された'
    end
    suspect_description = suspect.present? ? "被疑者・#{suspect.name}に対する殺人被疑事件に関し、" : ''
    judge_description = judge.present? ? "#{judge.full_name_with_title}の発した鑑定処分許可状に基づき" : ''
    "#{date_description}#{policeman}#{suspect_description}#{judge_description}#{victim_description}を解剖の上、下記事項に就き鑑定すべき旨私に嘱託#{final_verb}。"
  end

  def victim_description
    if victim.present?
      age = victim.death_age.present? ? "（#{victim.death_age}歳）" : ''
      "死者・#{victim.name}#{age}"
    else
      '身元不明の遺体'
    end
  end

  def second_paragraph_text
    place_description = place.present? ? "#{place.address}#{place.autopsy_room}において、" : ''
    "よって、#{place_description}#{time_interval_description}#{participants_description}剖検した。"
  end

  def time_interval_description # rubocop:disable PerceivedComplexity, CyclomaticComplexity
    from_am = starting_time.present? && starting_time.hour < 12
    to_am = ending_time.present? && ending_time.hour < 12
    if starting_time.present?
      from = if from_am
               "#{starting_time.to_era('%O%E年%m月%d日 午前%H時%M分')}より"
             else
               "#{starting_time.to_era('%O%E年%m月%d日 午後%H時%M分')}より"
             end
    end
    if ending_time.present?
      to = if from_am == to_am
             "#{ending_time.to_era('%H時%M分')}まで"
           elsif to_am
             "#{ending_time.to_era('午前%H時%M分')}まで"
           else
             "#{ending_time.to_era('午後%H時%M分')}まで"
           end
    end
    "#{from}#{to}、" if from.present? || to.present?
  end

  def participants_description
    phrases = []
    participations.includes(:role, person: :institution).each do |participation|
      if participation.role.name == 'Spectator'
        phrases.push("#{participation.person.full_name_with_title}の立ち会いの上")
      elsif participation.role.name == 'Assistant'
        phrases.push("#{participation.person.full_name_with_title}の補助を受けて")
      end
    end
    phrases.join('、')
  end

  accepts_nested_attributes_for :suspect, :victim, :place, :examiner,
                                :police_inspector, :judge, :police_station,
                                :court,
                                reject_if: :all_blank

  def examination(examination_type)
    examinations.joins(:examination_type)
                .find_by(examination_types: { id: examination_type.id })
  end
end
