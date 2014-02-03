class Song < ActiveRecord::Base


  attr_accessible :about, :image, :lyrics, :title, :user_id, :song_file

  mount_uploader :song_file, SongFileUploader

  belongs_to :user

  validates :title, presence: true

end
