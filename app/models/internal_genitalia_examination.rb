# == Schema Information
#
# Table name: internal_genitalia_examinations
#
#  id                :integer          not null, primary key
#  examination_id    :integer
#  length            :float
#  fundal_width      :float
#  cervical_width    :float
#  endometrium_color :integer
#  ovaries_presence  :integer
#  ovaries_distance  :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class InternalGenitaliaExamination < ExaminationBase
  enum endometrium_color: %i[unknown pale], _prefix: true, i18n_key: :color
  enum ovaries_presence: %i[unknown yes left_is_missing right_is_missing
                            no], _prefix: true
end
