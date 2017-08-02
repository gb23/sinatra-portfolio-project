class CreateFridges < ActiveRecord::Migration
  def change
    create_table :fridges do |t|
      t.string :name
    end
  end
end
