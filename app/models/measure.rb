class Measure < ApplicationRecord
  belongs_to :user

  validates_presence_of :height, :weight, :bmi, :bicep, :chest, :waist, :hips, :thigh, :calf
end
