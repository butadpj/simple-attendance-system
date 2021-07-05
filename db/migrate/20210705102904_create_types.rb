class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :type, default: ""
      t.integer :min_hours

      t.timestamps
    end
  end
end
