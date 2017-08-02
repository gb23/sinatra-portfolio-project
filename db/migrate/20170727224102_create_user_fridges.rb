class CreateUserFridges < ActiveRecord::Migration
  def change
    create_table :user_fridges do |t|
      t.integer :user_id
      t.integer :fridge_id
    end
  end
end
