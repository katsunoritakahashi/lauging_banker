class AddColumnUsers2 < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :stock, :integer
    add_column :users, :bonds, :integer
    add_column :users, :pachinko, :integer
    remove_column :users, :saving, :integer
  end
end
