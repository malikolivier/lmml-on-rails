class InternalAdrenalGlandsExaminationDecorator < DualExaminationBaseDecorator
  delegate :cortex_thickness, :medulla_thickness, :left?, :right?
end
