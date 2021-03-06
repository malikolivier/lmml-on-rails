class LmmlFile
  VERSION = Settings.lmml_version

  def initialize(autopsy_id = nil)
    @autopsy = if autopsy_id.present?
                 Autopsy.find(autopsy_id)
               else
                 Autopsy.new
               end
  end

  def as_json
    { version: VERSION, autopsy: @autopsy.as_lmml_json }
  end
  delegate :to_json, to: :as_json

  def to_xml
    as_json.to_xml(root: 'lmml')
  end

  # rubocop:disable Lint/UnusedMethodArgument
  def from_json(json)
    raise NotImplementedError
  end

  def from_xml(xml)
    raise NotImplementedError
  end
  # rubocop:enable Lint/UnusedMethodArgument

  class << self
    delegate :from_json, to: :new
    delegate :from_xml, to: :new
  end
end
