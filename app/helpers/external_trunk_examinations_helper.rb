module ExternalTrunkExaminationsHelper
  def translated_external_trunk_abdominal_discolorations
    ExternalTrunkExamination.abdominal_discolorations.map do |discoloration, _|
      [t("discoloration.#{discoloration}"), discoloration]
    end
  end
end
