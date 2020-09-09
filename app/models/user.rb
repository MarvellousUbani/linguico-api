# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :appointments, dependent: :destroy
  has_many :teachers, through: :appointments

  # validations
  validates_presence_of :name, :email, :password_digest

  enum role: %i[student admin]
end
