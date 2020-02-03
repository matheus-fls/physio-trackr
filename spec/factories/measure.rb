FactoryBot.define do
  factory :measures do
    height { Faker::Number.number(100) }
    weight { Faker::Number.number(100) }
    bmi { Faker::Number.number(100) }
    bicep { Faker::Number.number(100) }
    chest { Faker::Number.number(100) }
    waist { Faker::Number.number(100) }
    hips { Faker::Number.number(100) }
    thigh { Faker::Number.number(100) }
    calf { Faker::Number.number(100) }
    user_id { Faker::Number.number(100) }
  end
end
