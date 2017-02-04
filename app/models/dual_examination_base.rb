class DualExaminationBase < ExaminationBase
  self.abstract_class = true

  default_scope { order(:deixis) }

  enum deixis: Settings.enums.deixes
end
