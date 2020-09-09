# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    desc { Faker::Lorem.word }
    user_id { 6 }
    teacher_id { 1 }
    appointment_date { Faker::Time.forward(days: 23, period: :morning) }
    appointment_time { Faker::Time.forward(days: 23, period: :morning) }
  end
end
