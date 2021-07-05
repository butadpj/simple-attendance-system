class ChangeEmployeeTypesToEmployment < ActiveRecord::Migration[6.1]
  def change
    rename_table :employee_types, :employments
  end
end
