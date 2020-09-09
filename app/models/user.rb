class User < ApplicationRecord
    has_secure_password
    
    has_many :appointments, dependent: :destroy
    has_many :teachers, :through => :appointments

    # validations
    validates_presence_of :name, :email, :password_digest
    enum role: [:student, :admin]
end
