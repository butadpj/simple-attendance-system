class CreateEmployments < ActiveRecord::Migration[6.1]
  def change
    create_table :employments do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
