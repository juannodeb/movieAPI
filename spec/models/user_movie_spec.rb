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
require 'rails_helper'

RSpec.describe UserMovie, type: :model do
  subject = FactoryBot.build(:user_movie)

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without user_id" do
      subject.user_id = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without movie_id" do
      subject.movie_id = nil
      expect(subject).not_to be_valid
    end
  end

  # Associations
  describe "Associations" do
    it "belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to movie" do
      assc = described_class.reflect_on_association(:movie)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
