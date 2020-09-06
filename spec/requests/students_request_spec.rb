require 'rails_helper'

RSpec.describe 'Students API', type: :request do
  let(:student) { build(:student) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) { { name: student.name, email: student.email, password: student.password, password_confirmation: student.password } }

  # Student signup test suite
  describe 'POST /api/v1/students' do
    context 'when valid request' do
      before { post '/api/v1/students', params: valid_attributes.to_json, headers: headers }

      it 'creates a new student' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/api/v1/students', params: {}, headers: headers }

      it 'does not create a new student' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end
  end
end