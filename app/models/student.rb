class Student < ApplicationRecord
    has_many :appointments
    has_many :teachers, :through => :appointments
end
