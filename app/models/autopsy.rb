# == Schema Information
#
# Table name: autopsies
#
#  id                  :integer          not null, primary key
#  completed           :boolean          default(FALSE)
#  number              :text
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
    has_many :explications
    has_many :examinations
    has_many :tests
    has_many :photographs
end
