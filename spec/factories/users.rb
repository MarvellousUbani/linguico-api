# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Lorem.word }
  end

  factory :admin, { parent: :user } do
    name { 'admin' }
    email { 'admin@mail.com' }
    password { 'foobar' }
    role { 1 }
  end
end
