class AddColumnUsers3 < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :total, :integer
  end
end
