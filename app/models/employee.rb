class Employee < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true

  has_many :employee_types
  has_many :types, through: :employee_types
end
