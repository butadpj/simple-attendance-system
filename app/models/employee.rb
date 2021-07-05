class Employee < ApplicationRecord
  belongs_to :user

  has_many :employee_types
  has_many :types, through: :employee_types
end
