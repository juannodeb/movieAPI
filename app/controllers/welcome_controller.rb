class WelcomeController < ApplicationController
  # ===== Name:
  # Returns the root message
  # ===== URL:
  # /
  # ===== Action:
  # GET
  # ===== Return:
  # {
  #  "success": true,
  #  "message": "Welcome to movieAPI"
  # }
  def index
    render json: {
      success: true,
      message: 'Welcome to movieAPI'
    }
  end
end
