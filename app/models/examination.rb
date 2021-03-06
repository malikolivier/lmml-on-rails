# == Schema Information
#
# Table name: examinations
#
#  id                  :integer          not null, primary key
#  completed           :boolean          default(FALSE)
#  note                :text
#  autopsy_id          :integer          not null
#  examination_type_id :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Examination < ApplicationRecord
  belongs_to :autopsy, required: true
  belongs_to :examination_type, required: true

  has_many :injuries

  default_scope do
    joins(:examination_type).order('`examination_types`.`placement`')
  end

  scope :by_autopsy, ->(autopsy) { where(autopsy: autopsy) }
  scope :by_examination_type, lambda { |examination_type|
    where(examination_type: examination_type)
  }

  def get
    if unique_examination?
      examination = examination_type.this_examination_model
                                    .find_by(examination: self)
      examination ||
        examination_type.this_examination_model.new(examination: self)
    else
      examination_type.this_examination_model.where(examination: self)
    end
  end

  # Return a JSON-like hash representing the given examination
  def serialize
    examination = get
    if examination.respond_to? :map
      examination.map do |one|
        one.as_lmml_json.except!('examination')
      end
    else
      examination.as_lmml_json.except!('examination')
    end
  end

  def unique_examination?
    examination_type.organs.count <= 1
  end

  includes_in_json examination_type: ExaminationType.as_lmml_params,
                   injuries: Injury.as_lmml_params
  includes_method_in_json :serialize

  def expected_body_references
    examination_type.body_references
  end
  delegate :reachable_organs, to: :examination_type

  def name
    examination_type.key_string
  end
end
