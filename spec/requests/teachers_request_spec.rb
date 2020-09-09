# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Teachers', type: :request do
  let(:teacher) { build(:teacher) }
  let(:headers) { valid_headers.except('Content-Type') }
  let(:valid_attributes) { { name: teacher.name, email: teacher.email, password: teacher.password, password_confirmation: teacher.password } }

  # teacher signup test suite
end
