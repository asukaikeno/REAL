class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :title
      t.text :content
      t.string :place
      t.string :cost
      t.string :link
      t.string :user_id

      t.timestamps null: false
    end
  end
end
