# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  name                   :string
#  nickname               :string
#  image                  :string
#  email                  :string
#  tokens                 :json
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
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
