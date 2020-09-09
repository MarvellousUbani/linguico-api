# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  # validations
  validates_presence_of :desc, :appointment_date, :appointment_time
end
