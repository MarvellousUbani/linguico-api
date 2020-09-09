# frozen_string_literal: true

# spec/factories/todos.rb
FactoryBot.define do
  factory :teacher do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Lorem.word }
  end
end
