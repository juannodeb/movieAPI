# frozen_string_literal: true

class Api::V1::UserMoviesController < ApplicationController
  before_action :authenticate_api_v1_user!

  # Renders the current user favorite movies or message in case they have no favorite movies yet
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

  # Renders an specific favorites list movie record
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

  # Creates an UserMovie record with given ids or returns error message when missing
  def create
    user_movie = UserMovie.find_or_create_by(user_movie_params)

    if user_movie.save!
      success = true
      message = 'UserMovie updated or created successfully'
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

  # Removes given UserMovie id record when the user doesn't want the movie on their favorites list
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
