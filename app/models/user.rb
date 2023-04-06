class User < ApplicationRecord
  has_many :tickets
  enum role: { user: 0, admin: 1 }
  validates :email, :user_name, :phone, :password_digest, :role, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[A-Za-z]+\z/ }
  validates :email, :user_name, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, numericality: true, length: { minimum: 10, maximum: 15 }
  has_secure_password
end
