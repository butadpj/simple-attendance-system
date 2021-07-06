class User < ApplicationRecord
  has_secure_password

  has_one :employee

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :username, presence: true, uniqueness: true
end
