class EmployeeType < ApplicationRecord
  belongs_to :employee
  belongs_to :type

  has_many :attendances
end
