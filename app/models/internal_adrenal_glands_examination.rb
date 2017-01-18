# == Schema Information
#
# Table name: internal_adrenal_glands_examinations
#
#  id                :integer          not null, primary key
#  examination_id    :integer
#  deixis            :integer
#  cortex_thickness  :integer
#  medulla_thickness :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class InternalAdrenalGlandsExamination < ExaminationBase
  enum deixis: Settings.enums.deixes

  enum cortex_thickness: Settings.enums.five_scale_thickness,
       _prefix: 'cortex'
  enum medulla_thickness: Settings.enums.five_scale_thickness,
       _prefix: 'medulla'
end
