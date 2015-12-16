class AddPicturesToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :picture2, :string
    add_column :spots, :picture3, :string
    add_column :spots, :picture4, :string
  end
end
