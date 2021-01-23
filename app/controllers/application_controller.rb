# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid_response

  # This method gets triggered when a movie with given id does not exist
  def render_not_found_response
    render json: {
      success: false,
      message: "Could not find a movie with id #{params[:id]}"
    }, status: :not_found
  end

  # This method gets triggered when a record is missing data to get created
  def render_record_invalid_response
    render json: {
      success: false,
      message: 'Could not create the record. User or Movie ids are missing'
    }, status: :internal_server_error
  end
end
