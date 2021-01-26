# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  title       :string
#  director    :string
#  year        :string
#  image       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Movie < ApplicationRecord
  # Validations
  validates :title, :director, :year, :image, :description, presence: true

  # Associations
  has_many :user_movies, dependent: :destroy
end
