# == Schema Information
#
# Table name: internal_stomach_examinations
#
#  id                :integer          not null, primary key
#  examination_id    :integer
#  content_color     :integer
#  content_smell     :integer
#  content_aspect    :integer
#  content_quantity  :float
#  content_digestion :integer
#  rugae             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class InternalStomachExamination < ExaminationBase
  enum content_color: %i[unknown yellow green], _prefix: 'color',
       i18n_key: :color
  enum content_smell: %i[unknown putrid acid], _prefix: 'smell', i18n_key: :odor
  enum content_aspect: %i[unknown watery], _prefix: 'aspect'
  enum content_digestion: %i[unknown not_digested digested partly_digested],
       _prefix: 'content'

  enum rugae: %i[unknown persistent not_persistent], _prefix: true
end
