require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { should have_many(:appointments) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
