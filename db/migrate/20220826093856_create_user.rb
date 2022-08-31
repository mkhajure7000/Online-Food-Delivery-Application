class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :contact_number
      t.string :password_digest
      t.boolean :is_admin,default: false
    end
  end
end
