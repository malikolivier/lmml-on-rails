class LmmlFilesControllerSchema < RootSchema
  swagger_path '/lmml_files/{autopsy_id}' do
    operation :get do
      key :description, 'Return LMML file for designated autopsy'
      key :operationId, 'returnLmmlForAutopsy'
      key :produces, %w(application/json application/xml)
      key :tags, ['LMML file']
      parameter do
        key :name, :autopsy_id
        key :in, :path
        key :description, 'LMML file to get'
        key :required, true
        key :type, :number
      end
      response 200 do
        key :description, 'LMML file'
        schema do
          key :title, 'LmmlFile'
          property :lmml do
            key :'$ref', :LmmlFile
          end
        end
      end
    end
  end
end
