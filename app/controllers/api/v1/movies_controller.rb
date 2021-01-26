# frozen_string_literal: true

class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_api_v1_user!

  # ===== Name:
  # Returns the existing movies
  # ===== URL:
  # /api/v1/movies
  # ===== Action:
  # GET
  # ===== Return:
  # [
  #  {
  #   "id": 1,
  #   "title": "My movie",
  #   "director": "John Doe",
  #   "year": "2001",
  #   "image": "my_poster.jpg",
  #   "description": "My description"
  #  },
  #  ...
  # ]
  def index
    movies = Movie.all

    render json: movies, except: [:created_at, :updated_at]
  end

  # ===== Name:
  # Returns an specific existing movies
  # ===== URL:
  # /api/v1/movies/:id
  # ===== Action:
  # GET
  # ===== Parameters:
  # * +id+ : Integer
  # ===== Return:
  # {
  #  "id": 1,
  #  "title": "My movie",
  #  "director": "John Doe",
  #  "year": "2001",
  #  "image": "my_poster.jpg",
  #  "description": "My description"
  # }
  def show
    movie = Movie.find(params[:id])

    render json: movie, except: [:created_at, :updated_at]
  end
end
