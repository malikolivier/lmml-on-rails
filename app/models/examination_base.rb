class ExaminationBase < ApplicationRecord
  self.abstract_class = true

  belongs_to :examination, required: true

  accepts_nested_attributes_for :examination, update_only: true

  includes_in_json :examination

  class << self
    # Convenient function to get the examination out of ActiveRecord::Relation
    # on an instance of a class deriving from ExaminationBase.
    # When the items in the relation all holds the same examination, returns
    # the examination. Returns nil if the relation is empty.
    def examination
      take.examination if count > 0
    end
  end
end
