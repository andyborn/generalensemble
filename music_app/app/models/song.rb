class Song < ActiveRecord::Base


  attr_accessible :about, :image, :lyrics, :title, :user_id, :song_file

  

  mount_uploader :song_file, SongFileUploader
  mount_uploader :image, ArtistImageUploader


  belongs_to :user
  has_many :comments

  validates :title, presence: true


end
