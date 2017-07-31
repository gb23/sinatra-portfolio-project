class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :datetime
      t.string :location
      t.integer :rocket_id
    end
  end
end
