class AddSongFileToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_file, :string
  end
end
