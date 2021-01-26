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
FactoryBot.define do
  factory :movie do
    title { 'My Movie' }
    director { 'John Doe' }
    year { '2009' }
    image { 'this is the image url' }
    description { 'This is the description' }
  end
end
