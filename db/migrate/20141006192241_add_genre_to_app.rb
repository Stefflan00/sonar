class AddGenreToApp < ActiveRecord::Migration
  def change
    add_column :apps, :genre, :string
  end
end
