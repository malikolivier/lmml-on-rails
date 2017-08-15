class Api::PeopleController < ApplicationController
  def index
    params = index_params
    @people = Person.order(params[:order_by] => params[:asc])
                    .limit(params[:limit])
  end

  private

  def index_params
    permitted_params = params.permit(:order_by, :asc, :limit)
    permitted_params[:order_by] ||= 'id'
    permitted_params[:asc] ||= 'DESC'
    permitted_params[:limit] ||= 100
    permitted_params
  end
end
