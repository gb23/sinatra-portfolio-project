class CreatePayloads < ActiveRecord::Migration
  def change
    create_table :payloads do |t|
      t.string :name
      t.string :purpose
      t.string :payload_supplier
      t.text :about
      t.float :weight
      t.integer :rocket_id
    end
  end
end
