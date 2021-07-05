class Type < ApplicationRecord
  has_one :employment
  has_many :employee, through: :employment

  after_create :set_type_default

  def set_type_default
    employeeType = Type.last
    if employeeType.name == 'full-time'
      employeeType.min_hours = 160
      employeeType.save
    elsif employeeType.name == 'part-time'
      employeeType.min_hours = 80
      employeeType.save
    end
  end
end
