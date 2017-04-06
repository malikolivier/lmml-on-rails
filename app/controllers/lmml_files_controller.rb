class LmmlFilesController < ApplicationController
  before_action :set_default_request_format
  skip_before_action :verify_authenticity_token

  # GET /lmml_files/:id
  def show
    @lmml_file = LmmlFile.new(params[:id])
  end

  # POST /lmml_files
  def create
    @lmml_file = if request.headers['Content-Type'] == 'application/xml'
                   LmmlFile.from_xml(request.body.read)
                 else
                   LmmlFile.from_json(request.body.read)
                 end
  end
end
