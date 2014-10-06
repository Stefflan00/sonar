class ChangeSomeFormatInApp < ActiveRecord::Migration
  def change
    change_column :apps, :price, :string
    change_column :apps, :rating, :string

  end
end
