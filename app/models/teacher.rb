class Teacher < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :students, :through => :appointments

    # validations
    validates_presence_of :name, :email, :password_digest, :languages
end
