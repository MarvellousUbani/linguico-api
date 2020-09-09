require 'rails_helper'

RSpec.describe "Appointments", type: :request do
 # initialize test data 

 let!(:user) { FactoryBot.create(:user) }
 let(:user_id) {user.id}
 let(:teacher) {create(:teacher)}
 let(:teacher_id) {teacher.id}
 let!(:appointments) {Appointment.create({desc:"To learn for Spanish", appointment_date:Date.parse('2020-09-20'), appointment_time:Time.parse("20/9/2020 15:00:00"), teacher_id:teacher_id,user_id:user_id}) }
 let(:appointment_id) { appointments.id }
 let(:headers) { valid_headers.except('Content-Type') }


 # Test suite for GET /appointments
 describe 'GET /appointments' do
   # make HTTP get request before each example
   before { get "/api/v1/appointments/", params: {}, headers: headers }

   it 'returns appointments' do
     # Note `json` is a custom helper to parse JSON responses
     expect(json).not_to be_empty
     expect(json.size).to eq(1)
   end

   it 'returns status code 200' do
     expect(response).to have_http_status(200)
   end
 end

 # Test suite for GET /appointments/:id
 describe 'GET /appointments/:id' do
   before { get "/api/v1/appointments/#{appointment_id}",  params: {}, headers: headers }

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
   
   let(:valid_attributes) { { desc: 'Practice TEF French', appointment_date: Date.parse('2020-09-20'), appointment_time:Time.parse("20/9/2020 15:00:00"),
                              user_id:user_id, teacher_id: teacher_id } }

   context 'when the request is valid' do
     before { post "/api/v1/appointments", params: valid_attributes, headers: headers}

     it 'creates a appointment' do
       expect(json['desc']).to eq('Practice TEF French')
     end

     it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
   end

   context 'when the request is invalid' do
     before { post "/api/v1/appointments", params: { desc: 'Foobar' }, headers: headers }

     it 'returns status code 422' do
       expect(response).to have_http_status(422)
     end

     it 'returns a validation failure message' do
       expect(response.body)
         .to match(/Teacher must exist, Appointment date can't be blank, Appointment time can't be blank/)
     end
   end
 end

 # Test suite for PUT /appointments/:id
 describe 'PUT /appointments/:id' do
   let(:valid_attributes) { { desc: 'Learn IELTS English' } }

   context 'when the record exists' do
     before { put "/api/v1/appointments/#{appointment_id}", params: valid_attributes, headers: headers}

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
   before { delete "/api/v1/appointments/#{appointment_id}", params: {}, headers: headers }

   it 'returns status code 204' do
     expect(response).to have_http_status(204)
   end
 end
end
