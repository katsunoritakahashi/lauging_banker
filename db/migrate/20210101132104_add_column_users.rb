class AddColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :month, :integer
    remove_column :users, :income, :integer
  end
end
