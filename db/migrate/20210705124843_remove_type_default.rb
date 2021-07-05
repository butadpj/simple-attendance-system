class RemoveTypeDefault < ActiveRecord::Migration[6.1]
  def change
    remove_column :types, :type, :string
    add_column :types, :name, :string
  end
end
