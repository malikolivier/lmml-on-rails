class RigoresMortisDecorator < ApplicationCollectionDecorator
  def description
    pb = PhraseBuilder.new(only_comma: true)
    RigorMortis.intensities.each do |intensity, _|
      joints = h.join_words(joints_by_intensity(intensity))
      next if joints.empty?
      int_desc = RigorMortisDecorator.intensity_description(intensity)
      joints_desc = t('.joints_description', joints: joints)
      pb << t('.single_description', intensity: int_desc, joints: joints_desc)
    end
    return '' if pb.empty?
    t('.complete_description', single_description: pb.to_sentence_no_dot)
  end

  private

  def joints_by_intensity(intensity)
    object.send(intensity).map do |rigor_mortis|
      rigor_mortis.translated_enum_value(:joint)
    end
  end
end
