class Teacher < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :appointments, dependent: :destroy
    has_many :users, :through => :appointments

    # validations
    validates_presence_of :name, :email, :password_digest
end
