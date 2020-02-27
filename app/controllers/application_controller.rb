# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected

  def paginate(records)
    response.headers['Pagination-Count'] = records.count
    response.headers['Pagination-Page'] = params[:page] || 1
    response.headers['Pagination-Limit'] = params[:per] || 10

    records.page(params[:page]).per(params[:per])
  end

  def record_not_found(exception)
    render json: { errors: { record: ['not found'] } }, status: 404
  end
end
