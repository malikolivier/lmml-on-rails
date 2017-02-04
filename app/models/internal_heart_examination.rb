# == Schema Information
#
# Table name: internal_heart_examinations
#
#  id                          :integer          not null, primary key
#  examination_id              :integer
#  weight                      :float
#  rigor_mortis                :integer
#  epicardial_lipomatosis      :integer
#  epicardial_petechia         :integer
#  extracted_blood_quantity    :float
#  extracted_blood_color       :integer
#  extracted_blood_coagulation :integer
#  thickness_left              :float
#  thickness_right             :float
#  scar_left                   :integer
#  scar_right                  :integer
#  pulmonary_artery_width      :float
#  pulmonary_artery_thrombus   :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class InternalHeartExamination < ExaminationBase
  enum rigor_mortis: Settings.enums.existence, _prefix: true
  enum epicardial_lipomatosis: Settings.enums.existence, _prefix: true
  enum epicardial_petechia: Settings.enums.five_scale_quantity, _prefix: true
  # dark red: 暗赤色, florid: 鮮紅色
  enum extracted_blood_color: [:dark_red, :florid], _prefix: true
  enum extracted_blood_coagulation: Settings.enums.existence, _prefix: true

  has_many :coronary_arteries, -> { order(:category) },
           inverse_of: :internal_heart_examination
  has_many :heart_chambers, -> { order(:category) },
           inverse_of: :internal_heart_examination

  enum scar_left: Settings.enums.existence, _prefix: true
  enum scar_right: Settings.enums.existence, _prefix: true
  enum pulmonary_artery_thrombus: Settings.enums.existence, _prefix: true

  def arteries_description
    return '' if coronary_arteries.count.zero?
    phrases = []
    stenosis_count = 0
    coronary_arteries.each do |artery|
      phrases.push(artery.description)
      stenosis_count += 1 if artery.stenosis?
    end
    if stenosis_count.zero?
      phrases = []
      coronary_arteries.each do |artery|
        phrases.push(artery.name)
      end
      "#{phrases.to_sentence}に硬化性狭窄なし。"
    else
      description = "#{phrases.to_sentence(words_connector: '、',
                                           last_word_connector: '、')}" \
                    'の硬化性狭窄がある'
      if coronary_arteries.blood_clot.none?
        "#{description}が、血栓はない。"
      else
        # TODO: make something more descriptive,
        # though I do not really know what to say
        "#{description}。"
      end
    end
  end

  def heart_chambers_description # rubocop:disable CyclomaticComplexity, PerceivedComplexity
    return '' if heart_chambers.count.zero?
    grouped_heart_chambers = heart_chambers.group_by(&:size)
    chamber_descriptions = []
    HeartChamber.sizes.each do |size, _| # rubocop:disable Metrics/BlockLength
      next if grouped_heart_chambers[size].blank?
      size_name = I18n.t "size.#{size}"
      status = 0b0
      status |= grouped_heart_chambers[size].any?(&:left_ventricle?) ? 1 : 0
      status |= grouped_heart_chambers[size].any?(&:right_ventricle?) ? 2 : 0
      status |= grouped_heart_chambers[size].any?(&:left_atrium?) ? 4 : 0
      status |= grouped_heart_chambers[size].any?(&:right_atrium?) ? 8 : 0
      case status
      when 0b0001
        chamber_descriptions.push("左心室は#{size_name}")
      when 0b0010
        chamber_descriptions.push("右心室は#{size_name}")
      when 0b0011
        chamber_descriptions.push("左右心室は#{size_name}")
      when 0b0100
        chamber_descriptions.push("左心房は#{size_name}")
      when 0b0101
        chamber_descriptions.push("右心室・左心房は#{size_name}")
      when 0b0110
        chamber_descriptions.push("左心室・左心房は#{size_name}")
      when 0b0111
        chamber_descriptions.push("左右の心室・左心房は#{size_name}")
      when 0b1000
        chamber_descriptions.push("右心房は#{size_name}")
      when 0b1001
        chamber_descriptions.push("左心室・右心房は#{size_name}")
      when 0b1010
        chamber_descriptions.push("右心室・右心房は#{size_name}")
      when 0b1011
        chamber_descriptions.push("左右心室・右心房は#{size_name}")
      when 0b1100
        chamber_descriptions.push("左右心房は#{size_name}")
      when 0b1101
        chamber_descriptions.push("右心室・左右心房は#{size_name}")
      when 0b1110
        chamber_descriptions.push("左心室・左右心房は#{size_name}")
      when 0b1111
        chamber_descriptions.push("左右の心室・心房は#{size_name}")
      else
        chamber_descriptions.push("Unhandled status value: #{status}")
      end
    end
    description = chamber_descriptions.to_sentence(words_connector: '、',
                                                   last_word_connector: '、')
    if examination.injuries.none?
      "#{description}、内膜および各弁膜に異常なし。"
    else
      "#{description}。"
    end
  end

  accepts_nested_attributes_for :coronary_arteries, :heart_chambers,
                                reject_if: :all_blank

  includes_in_json :coronary_arteries, :heart_chambers
end
