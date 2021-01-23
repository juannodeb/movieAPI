class WelcomeController < ApplicationController
  def index
    render json: {
      success: true,
      message: 'Welcome to movieAPI'
    }
  end
end
