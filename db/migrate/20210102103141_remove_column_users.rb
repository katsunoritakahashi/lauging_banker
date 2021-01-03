class RemoveColumnUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :month, :integer
    remove_column :users, :stock, :integer
    remove_column :users, :bonds, :integer
    remove_column :users, :pachinko, :integer
    remove_column :users, :saving, :integer
    remove_column :users, :total, :integer
  end
end
