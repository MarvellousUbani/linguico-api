require 'rails_helper'

RSpec.describe "Teachers", type: :request do
    let(:teacher) { build(:teacher) }
    let(:headers) { valid_headers.except('Content-Type') }
    let(:valid_attributes) { { name: teacher.name, email: teacher.email, password: teacher.password, password_confirmation: teacher.password } }
  
    # teacher signup test suite
    describe 'POST /api/v1/teachers' do
  
      context 'when invalid request' do
        before { post '/api/v1/teachers', params: {}, headers: headers }
  
        it 'does not create a new teacher' do
          expect(response).to have_http_status(422)
        end
      end
    end
end
