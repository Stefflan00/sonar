class AddAltPriceToApp < ActiveRecord::Migration
  def change
    add_column :apps, :alt_price, :string
  end
end
