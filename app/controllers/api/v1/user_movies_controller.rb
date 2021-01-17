# frozen_string_literal: true

class Api::V1::UserMoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    user_movies = UserMovie.where(user_id: params[:user_id])
    movies = Movie.where(id: user_movies.map(&:id))

    res = movies.empty? ? { message: 'You have no movies in your favorites list' } : movies

    render json: res, except: [:created_at, :updated_at]
  end
end
