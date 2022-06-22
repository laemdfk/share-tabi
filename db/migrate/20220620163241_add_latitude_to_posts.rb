class AddLatitudeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :latitude, :float
  end
end
