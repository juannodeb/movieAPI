# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # This method gets triggered when a movie with given id does not exist
  def render_not_found_response
    render json: {
      success: false,
      message: "Could not find a movie with id #{params[:id]}"
    }, status: :not_found
  end
end
