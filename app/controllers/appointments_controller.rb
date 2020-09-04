class AppointmentsController < ApplicationController
    # app/controllers/appointments_controller.rb
class appointmentsController < ApplicationController
    before_action :set_appointment, only: [:show, :update, :destroy]
  
    # GET /appointments
    def index
      @appointments = appointment.all
      json_response(@appointments)
    end
  
    # POST /appointments
    def create
      @appointment = appointment.create!(appointment_params)
      json_response(@appointment, :created)
    end
  
    # GET /appointments/:id
    def show
      json_response(@appointment)
    end
  
    # PUT /appointments/:id
    def update
      @appointment.update(appointment_params)
      head :no_content
    end
  
    # DELETE /appointments/:id
    def destroy
      @appointment.destroy
      head :no_content
    end
  
    private
  
    def appointment_params
      # whitelist params
      params.permit(:desc, :appointment_date, :appointment_time)
    end
  
    def set_appointment
      @appointment = appointment.find(params[:id])
    end
  end
end
