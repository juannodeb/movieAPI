require 'rails_helper'

RSpec.describe User, type: :model do
  subject = FactoryBot.build(:user)

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without email" do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without password" do
      subject.password = nil
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
