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
    # if params[:locale] is nil or is unavailable then
    # I18n.default_locale will be used
    if params[:locale].blank?
      I18n.locale = I18n.default_locale
    elsif locale_available?
      I18n.locale = params[:locale]
    else
      Rails.logger.debug("Unsupported locale: #{params[:locale]}")
      I18n.locale = I18n.default_locale
    end
  end

  def locale_available?
    I18n.available_locales.include?(params[:locale].to_sym)
  end
end
