class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.text :note
      t.datetime :date_sell_by
      t.datetime :date_expires
      t.float :grams
      t.integer :fridge_id
    end
  end
end
