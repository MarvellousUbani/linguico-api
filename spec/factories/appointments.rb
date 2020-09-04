# spec/factories/todos.rb
FactoryBot.define do
    factory :appointment do
      desc { Faker::Lorem.word }
      student {Student.first || association(:student)}
      teacher {Teacher.first || association(:teacher)}
      appointment_date { Faker::Time.forward(days: 23, period: :morning) }
      appointment_time { Faker::Time.forward(days: 23, period: :morning) }
    end
  end