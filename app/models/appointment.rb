class Appointment < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  # validations
  validates_presence_of :desc, :appointment_date, :appointment_time
end
