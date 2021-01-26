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
FactoryBot.define do
  factory :user_movie do
    user_id { FactoryBot.create(:user).id }
    movie_id { FactoryBot.create(:movie).id }
  end
end
