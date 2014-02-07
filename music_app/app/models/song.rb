class Song < ActiveRecord::Base


  attr_accessible :about, :image, :lyrics, :title, :user_id, :song_file

  

  mount_uploader :song_file, SongFileUploader
  mount_uploader :image, ArtistImageUploader


  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :song_file, presence: true
  validates_length_of :title, :maximum => 50
  validates_length_of :title, :maximum => 500



end
