require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    id { Faker::Number.number(1000) }
  end
end
