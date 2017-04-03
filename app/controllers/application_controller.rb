class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index; end

  private

  def model_class
    controller_name.classify.constantize
  end
end
