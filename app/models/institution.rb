# == Schema Information
#
# Table name: institutions
#
#  id                              :integer          not null, primary key
#  name                            :text
#  address                         :text
#  autopsy_room                    :text
#  autopsies_places_count          :integer          default(0)
#  autopsies_police_stations_count :integer          default(0)
#  autopsies_courts_count          :integer          default(0)
#  institution_type_id             :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class Institution < ApplicationRecord
  belongs_to :institution_type

  has_many :autopsies_places, class_name: Autopsy,
                              foreign_key: :place_id
  has_many :autopsies_police_stations, class_name: Autopsy,
                                       foreign_key: :police_station_id
  has_many :autopsies_courts, class_name: Autopsy,
                              foreign_key: :court_id

  scope :been_autopsy_place, lambda {
    where('autopsies_places_count > 0')
      .order(autopsies_places_count: :desc)
  }

  includes_in_json :institution_type
  excludes_in_json :autopsies_places_count, :autopsies_police_stations_count,
                   :autopsies_courts_count
end
