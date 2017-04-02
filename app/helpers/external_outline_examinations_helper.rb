module ExternalOutlineExaminationsHelper
  def translated_external_outline_constitutions
    ExternalOutlineExamination.constitutions.map do |constitution, _|
      folder = 'activerecord.enums.external_outline_examination.constitution'
      [t(constitution, scope: folder), constitution]
    end
  end
end
