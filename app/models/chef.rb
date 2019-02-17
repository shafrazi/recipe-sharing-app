class Chef < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :recipes

  validates :name, presence: true, length: {maximum: 30}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
end
