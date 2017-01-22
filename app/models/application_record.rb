class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    def json_includes
      @json_includes || []
    end
    attr_writer :json_includes
  end

  def as_lmml_json
    as_json(include: self.class.json_includes)
  end
end
