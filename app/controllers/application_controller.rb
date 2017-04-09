class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def index; end

  private

  def model_class
    controller_name.classify.constantize
  end

  def set_default_request_format
    request.format = :json unless params[:format]
  end

  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = params[:locale]
  end
end
