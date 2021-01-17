FactoryBot.define do
  factory :user_movie do
    user_id { FactoryBot.create(:user).id }
    movie_id { FactoryBot.create(:movie).id }
  end
end
