# Returns API doc as JSON Swagger 2.0
class ApidocsController < ActionController::Base
  # Create the list of all modules the files inside "doc/swagger_schemas" folder
  # These files define the API specification.
  # rubocop:disable Rails/FilePath
  SWAGGERED_MODULES = Dir.glob(Rails.root.join('doc/**/*.rb')).map do |path|
    %r{/doc/swagger_schemas/(\w+).rb$}.match(path)[1]
                                      .classify.constantize
  end # rubocop:enable Rails/FilePath

  # GET /apidocs
  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_MODULES)
  end
end
