require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject = FactoryBot.build(:movie)

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without title" do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without director" do
      subject.director = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without year" do
      subject.year = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without image" do
      subject.image = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without description" do
      subject.description = nil
      expect(subject).not_to be_valid
    end
  end

  # Associations
  describe "Associations" do
    it "has many user_movies" do
      assc = described_class.reflect_on_association(:user_movies)
      expect(assc.macro).to eq :has_many
    end
  end
end
