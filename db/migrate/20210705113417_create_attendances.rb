class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.references :employment, null: false, foreign_key: true
      t.time :sign_in
      t.time :sign_out
      t.date :date

      t.timestamps
    end
  end
end
