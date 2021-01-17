FactoryBot.define do
  factory :movie do
    title { 'My Movie' }
    director { 'John Doe' }
    year { '2009' }
    image { 'this is the image url' }
    description { 'This is the description' }
  end
end
