# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid_response

  # ===== Name:
  # Returns error message when a Movie with the given id does not exist
  # ===== URL:
  # /api/v1/movies/:id
  # ===== Action:
  # GET
  # ===== Parameters:
  # * +id+ : Integer
  # ===== Return:
  # {
  #  "success": false,
  #  "message": "Could not find a movie with id :id"
  # }
  def render_not_found_response
    render json: {
      success: false,
      message: "Could not find a movie with id #{params[:id]}"
    }, status: :not_found
  end

  # ===== Name:
  # Returns error message when a record with any of the given ids does not exist
  # ===== URL:
  # /api/v1/favorites
  # ===== Action:
  # POST
  # ===== Parameters:
  # * +user_id+ : Integer
  # * +movie_id+ : Integer
  # ===== Return:
  # {
  #  "success": false,
  #  "message": "Could not create the record. User or Movie ids are missing"
  # }
  def render_record_invalid_response
    render json: {
      success: false,
      message: 'Could not create the record. User or Movie does not exist'
    }, status: :internal_server_error
  end
end
