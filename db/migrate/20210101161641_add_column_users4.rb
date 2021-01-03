class AddColumnUsers4 < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :saving, :integer
  end
end
