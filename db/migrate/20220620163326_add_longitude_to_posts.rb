class AddLongitudeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :longitude, :float
  end
end
