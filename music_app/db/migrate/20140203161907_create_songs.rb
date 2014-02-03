class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :about
      t.string :image
      t.string :lyrics
      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
