# spec/factories/todos.rb
FactoryBot.define do
    factory :student do
      name { Faker::Name.name }
      email {Faker::Internet.email }
      password {Faker::Lorem.word}
    end
  end