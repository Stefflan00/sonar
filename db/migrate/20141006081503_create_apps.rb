class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :store_id
      t.string :name
      t.string :reflink
      t.text :img
      t.decimal :rating
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
