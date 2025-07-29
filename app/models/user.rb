class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  # Validations for User model
  before_save { self.email = email.downcase.strip }
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  has_secure_password
end