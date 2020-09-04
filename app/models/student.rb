class Student < ApplicationRecord
    
    has_many :appointments, dependent: :destroy
    has_many :teachers, :through => :appointments

    # validations
    validates_presence_of :name, :email, :password_digest, :languages
end
