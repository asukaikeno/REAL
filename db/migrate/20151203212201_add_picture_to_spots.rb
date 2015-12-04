class AddPictureToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :picture, :string
  end
end
