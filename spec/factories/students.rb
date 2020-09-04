# spec/factories/todos.rb
FactoryBot.define do
    factory :student do
      name { Faker::Name.name }
      email {Faker::Internet.email }
      password_digest {Faker::Lorem.word}
      languages {Faker::Json.shallow_json(width: 3, options: { key: 'ProgrammingLanguage.name ', value: 'ProgrammingLanguage.name' })}
    end
  end