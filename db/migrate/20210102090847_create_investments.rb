class CreateInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :investments do |t|
      t.integer :month
      t.integer :stock
      t.integer :bonds
      t.integer :pachinko
      t.integer :saving
      t.integer :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
