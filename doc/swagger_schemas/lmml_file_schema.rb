class LmmlFileSchema < RootSchema
  swagger_schema :LmmlFile do
    key :title, 'LmmlFile'
    key :required, %i[version]
    property :version do
      key :type, :string
    end
  end
end
