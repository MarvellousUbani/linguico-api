# frozen_string_literal: true

class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]

  # GET /appointments
  def index
    @appointments = current_user.appointments
    json_response(@appointments)
  end

  # POST /appointments
  def create
    @appointment = current_user.appointments.create!(appointment_params)
    # @appointment = User.first.appointments.build(appointment_params)
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
    params.permit(:desc, :appointment_date, :appointment_time, :user_id, :teacher_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
