# frozen_string_literal: true

class UserMovie < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :movie
end
