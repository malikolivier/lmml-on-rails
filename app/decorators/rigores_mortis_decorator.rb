class RigoresMortisDecorator < ApplicationCollectionDecorator
  def description
    object.group_by(&:category).map do |category, rigores|
      description_by_category(category, rigores)
    end
  end

  private

  def joints_description(rigores = self)
    joints = h.join_words(rigores.map do |rigor_mortis|
                            rigor_mortis.translated_enum_value(:joint)
                          end)
    if joints.empty?
      ''
    else
      t('.joints_description', joints: joints)
    end
  end

  def description_by_category(category, rigores_mortis = self)
    pb = PhraseBuilder.new(only_comma: true)
    category = RigorMortis.translated_enum_value(:category, category)
    rigores_mortis.group_by(&:intensity).each do |intensity, rigores|
      joints_desc = joints_description(rigores)
      next if joints_desc.empty?
      int_desc = RigorMortisDecorator.intensity_description(intensity)
      pb << t('.single_description', intensity: int_desc, joints: joints_desc)
    end
    return '' if pb.empty?
    t('.complete_description', single_description: pb.to_sentence_no_dot,
                               category: category)
  end
end
