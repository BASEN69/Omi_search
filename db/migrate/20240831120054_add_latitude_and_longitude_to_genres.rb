class AddLatitudeAndLongitudeToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :latitude, :float
    add_column :genres, :longitude, :float
  end
end
