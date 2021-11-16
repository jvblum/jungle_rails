class RecreateUsers < ActiveRecord::Migration
  # change name to first_name and add last_name column
  def change
    add_column :users, :last_name, :string
    rename_column :users, :name, :first_name
  end
end
