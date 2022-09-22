class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.float :total_amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
