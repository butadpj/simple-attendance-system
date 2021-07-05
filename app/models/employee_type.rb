class EmployeeType < ApplicationRecord
  belongs_to :employee
  belongs_to :type
end
