# frozen_string_literal: true

class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    movies = Movie.all

    render json: movies, except: [:created_at, :updated_at]
  end

  def show
    movie = Movie.find(params[:id])

    render json: movie, except: [:created_at, :updated_at]
  end
end
