# frozen_string_literal: true

class Movie < ApplicationRecord
  # Validations
  validates :title, :director, :year, :image, :description, presence: true

  # Associations
  has_many :user_movies, dependent: :destroy
end
