# frozen_string_literal: true

class Api::V1::UserMoviesController < ApplicationController
  before_action :authenticate_api_v1_user!

  # Renders the current user favorite movies or message in case they have no favorite movies yet
  def index
    user_movies = UserMovie.where(user_id: params[:user_id])
    movies = Movie.where(id: user_movies.map(&:id))

    if movies.empty?
      message = 'You have no movies in your favorites list'
    else
      message = 'Favorite list fetched successfully'
      user_movies = movies
    end

    render json: {
      success: true,
      message: message,
      user_movies: user_movies
    }, status: status, except: [:created_at, :updated_at]
  end

  # Creates an UserMovie record with given ids or returns error message when missing
  def create
    user_movie = UserMovie.new(user_movie_params)

    if user_movie.save!
      success = true
      message = 'UserMovie created successfully'
      status = :ok
    else
      success = false
      message = 'Could not create the UserMovie'
      status = :internal_server_error
    end

    render json: {
      success: success,
      message: message,
      user_movie: user_movie
    }, status: status, except: [:created_at, :updated_at]
  end

  private

  # Needed fields to create a UserMovie record (an user favorite movie)
  def user_movie_params
    params.require(:user_movie).permit(:user_id, :movie_id)
  end
end
