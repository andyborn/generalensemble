class User < ActiveRecord::Base
  has_secure_password

  mount_uploader :artist_image, ArtistImageUploader

  attr_accessible :artist_image, :artist_name, :bio, :email, :password, :website, :password_confirmation

  has_many :songs


  validates :password, presence: true, on: :create

  validates :email, presence: true

  validates :email, uniqueness: true

  validates :artist_name, uniqueness: true

  validates :artist_name, presence: true

  validates_length_of :bio, :maximum => 1000, :message => "less than 1000 characters if you don't mind"
end