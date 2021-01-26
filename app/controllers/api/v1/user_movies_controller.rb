# frozen_string_literal: true

class Api::V1::UserMoviesController < ApplicationController
  before_action :authenticate_api_v1_user!

  # ===== Name:
  # Returns the existing user_movies for the current_user
  # ===== URL:
  # /api/v1/favorites
  # ===== Action:
  # GET
  # ===== Return:
  # {
  #  "success": true,
  #  "message": "Favorites list fetched successfully",
  #  "user_movies": [
  #   {
  #    "id": 1,
  #    "title": "My movie",
  #    "director": "John Doe",
  #    "year": "2001",
  #    "image": "my_poster.jpg",
  #    "description": "My description"
  #   },
  #   ...
  #  ]
  # }
  # or if the user has no user_movies:
  # {
  #   "success": true,
  #   "message": "You have no movies in your favorites list",
  #   "user_movies": []
  # }
  def index
    user_movies = UserMovie.where(user_id: params[:user_id])
    movies = Movie.where(id: user_movies.map(&:movie_id))

    if user_movies.empty?
      message = 'You have no movies in your favorites list'
    else
      message = 'Favorites list fetched successfully'
      user_movies = movies
    end

    render json: {
      success: true,
      message: message,
      user_movies: user_movies
    }, status: status, except: [:created_at, :updated_at]
  end

  # ===== Name:
  # Returns an specific favorites list movie
  # ===== URL:
  # /api/v1/favorites/:id
  # ===== Action:
  # GET
  # ===== Parameters:
  # * +id+ : Integer
  # ===== Return:
  # {
  #   "success": true,
  #   "message": "Favorites list movie fetch successfully",
  #   "user_movie": [
  #       {
  #           "id": 10,
  #           "user_id": 1,
  #           "movie_id": 2
  #       }
  #   ]
  # }
  def show
    user_movie = UserMovie.where(movie_id: params[:user_movie][:movie_id])

    if user_movie.empty?
      success = false
      message = "Could not find a movie with the given id in your favorites list"
      status = :not_found
    else
      success = true
      message = 'Favorites list movie fetch successfully'
      status = :ok
    end

    render json: {
      success: success,
      message: message,
      user_movie: user_movie
    }, status: status, except: [:created_at, :updated_at]
  end

  # ===== Name:
  # Creates an UserMovie record with the given ids or returns error message when missing
  # ===== URL:
  # /api/v1/favorites/:id
  # ===== Action:
  # POST
  # ===== Parameters:
  # * +user_id+ : Integer
  # * +movie_id+ : Integer
  # ===== Return:
  # {
  #  "success": true,
  #  "message": "UserMovie updated or created successfully",
  #  "user_movie": {
  #   "id": 1,
  #   "user_id": 1,
  #   "movie_id": 1
  #  }
  # }
  # or if the user_id/movie_id are missing:
  # {
  #  "success": false,
  #  "message": "Could not create the record. User or Movie ids are missing"
  # }
  def create
    already_created = UserMovie.where(user_movie_params).present?
    user_movie = UserMovie.new(user_movie_params)

    if !already_created && user_movie.save!
      success = true
      message = 'UserMovie updated or created successfully'
      status = :ok
    else
      success = false
      message = 'Could not create the UserMovie or it already exists'
      status = :internal_server_error
      user_movie = []
    end

    render json: { success: success, message: message,
                   user_movie: user_movie }, status: status, except: [:created_at, :updated_at]
  end

  # ===== Name:
  # Removes an UserMovie record with the given id or returns error message when already removed
  # ===== URL:
  # /api/v1/favorites/:id
  # ===== Action:
  # DELETE
  # ===== Parameters:
  # * +id+ : Integer
  # ===== Return:
  # if success:
  #
  # if it was already removed:
  # {
  #  "success": false,
  #  "message": "Could not remove the UserMovie or it was already removed"
  # }
  def destroy
    user_movie = UserMovie.where(
      movie_id: params[:user_movie][:movie_id],
      user_id: params[:user_movie][:user_id]
    ).first

    if user_movie.present? && user_movie.destroy
      success = true
      message = 'UserMovie removed successfully'
      status = :no_content
    else
      success = false
      message = 'Could not remove the UserMovie or it was already removed'
      status = :internal_server_error
    end

    render json: { success: success, message: message }, status: status
  end

  private

  # Needed fields to create a UserMovie record (an user favorite movie)
  def user_movie_params
    params.require(:user_movie).permit(:user_id, :movie_id)
  end
end
