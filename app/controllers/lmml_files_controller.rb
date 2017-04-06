class LmmlFilesController < ApplicationController
  before_action :set_default_request_format

  def show
    @lmml_file = LmmlFile.new(params[:id])
  end

  def post
    # GET LMML FILE AS POST DATA
    case post_data
    when :json
      @lmml_file = LmmlFile.from_json(post_data)
    when :xml
      @lmml_file = LmmlFile.from_xml(post_data)
    end
  end
end
