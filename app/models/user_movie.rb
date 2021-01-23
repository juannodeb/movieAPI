# frozen_string_literal: true

# == Schema Information
#
# Table name: user_movies
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  movie_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserMovie < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :movie
end
