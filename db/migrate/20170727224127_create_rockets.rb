class CreateRockets < ActiveRecord::Migration
  def change
    create_table :rockets do |t|
      t.string :name
      t.integer :stages
      t.text :about
      t.text :mission
      t.integer :organization_id
    end
  end
end
