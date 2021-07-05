class CreateEmployeeTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_types do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
