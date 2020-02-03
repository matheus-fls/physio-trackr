FactoryBot.define do
  factory :users do
    name { Faker::StarWars.character }
    id { Faker::Number.number(1000) }
  end
end
