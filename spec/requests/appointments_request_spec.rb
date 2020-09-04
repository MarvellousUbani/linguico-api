require 'rails_helper'

RSpec.describe "Appointments", type: :request do
 # initialize test data 
 let!(:appointments) { create_list(:appointment, 10) }
 let(:appointment_id) { appointments.first.id }

 # Test suite for GET /appointments
 describe 'GET /appointments' do
   # make HTTP get request before each example
   before { get '/appointments' }

   it 'returns appointments' do
     # Note `json` is a custom helper to parse JSON responses
     expect(json).not_to be_empty
     expect(json.size).to eq(10)
   end

   it 'returns status code 200' do
     expect(response).to have_http_status(200)
   end
 end

 # Test suite for GET /appointments/:id
 describe 'GET /appointments/:id' do
   before { get "/appointments/#{appointment_id}" }

   context 'when the record exists' do
     it 'returns the appointment' do
       expect(json).not_to be_empty
       expect(json['id']).to eq(appointment_id)
     end

     it 'returns status code 200' do
       expect(response).to have_http_status(200)
     end
   end

   context 'when the record does not exist' do
     let(:appointment_id) { 100 }

     it 'returns status code 404' do
       expect(response).to have_http_status(404)
     end

     it 'returns a not found message' do
       expect(response.body).to match(/Couldn't find Appointment with 'id'=100/)
     end
   end
 end

 # Test suite for POST /appointments
 describe 'POST /appointments' do
   # valid payload
   

   let(:valid_attributes) { { desc: 'Practice TEF French', appointment_date: Date.parse('2020-09-20'), appointment_time:Time.parse("20/9/2020 15:00:00"), teacher: create(:teacher,name:"Bob Hanson", email:"bob@gmail.com",
    password_digest:"florabi", languages:{"french":true}), student: create(:student,name:"Marian Hanson", email:"marian@gmail.com",
    password_digest:"florabi") } }

   context 'when the request is valid' do
     before { post '/appointments', params: valid_attributes }

     it 'creates a appointment' do
       p json
       expect(json['desc']).to eq('Practice TEF French')
     end

     it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
   end

   context 'when the request is invalid' do
     before { post '/appointments', params: { desc: 'Foobar' } }

     it 'returns status code 422' do
       expect(response).to have_http_status(422)
     end

     it 'returns a validation failure message' do
       expect(response.body)
         .to match(/Validation failed: Student must exist, Teacher must exist, Appointment date can't be blank, Appointment time can't be blank/)
     end
   end
 end

 # Test suite for PUT /appointments/:id
 describe 'PUT /appointments/:id' do
   let(:valid_attributes) { { desc: 'Learn IELTS English' } }

   context 'when the record exists' do
     before { put "/appointments/#{appointment_id}", params: valid_attributes }

     it 'updates the record' do
       expect(response.body).to be_empty
     end

     it 'returns status code 204' do
       expect(response).to have_http_status(204)
     end
   end
 end

 # Test suite for DELETE /appointments/:id
 describe 'DELETE /appointments/:id' do
   before { delete "/appointments/#{appointment_id}" }

   it 'returns status code 204' do
     expect(response).to have_http_status(204)
   end
 end
end
