# == Schema Information
#
# Table name: injury_sizes
#
#  id                :integer          not null, primary key
#  shape             :integer
#  length            :float
#  width             :float
#  coordinate_system :integer
#  angle             :float
#  tohoku_ryu_size   :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class InjurySize < ApplicationRecord
  enum shape: %i[longitudinal round undefined]
  enum coordinate_system: Settings.enums.coordinate_system
  enum tohoku_ryu_size: %i[lt_pinhead pinhead lt_azuki azuki lt_soy soy
                           lt_fava fava lt_ginkgo ginkgo lt_chestnut chestnut
                           lt_chicken_egg chicken_egg]
end
