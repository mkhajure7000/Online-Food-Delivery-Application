class CreateJoinTableFoodCart < ActiveRecord::Migration[6.0]
  def change
    create_join_table :foods, :carts do |t|
      # t.index [:food_id, :cart_id]
      # t.index [:cart_id, :food_id]
    end
  end
end
