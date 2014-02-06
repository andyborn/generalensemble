class User < ActiveRecord::Base
  has_secure_password

  before_validation :set_default_role

  acts_as_taggable_on :tags

  

  mount_uploader :artist_image, ArtistImageUploader
  mount_uploader :banner_image, ArtistBannerUploader

  attr_accessible :background_colour, :main_body_colour, :header_font_colour, :artist_image, :banner_image, :artist_name, :bio, :email, :password, :website, :password_confirmation, :tag_list

  has_many :songs, dependent: :destroy
  has_many :comments, dependent: :destroy


  validates :password, presence: true, on: :create

  validates :email, presence: true

  validates :email, uniqueness: true

  validates :artist_name, uniqueness: true

  validates :artist_name, presence: true

  validates_length_of :bio, :maximum => 1000, :message => "less than 1000 characters if you don't mind"
  validates_length_of :header_font_colour, :is => 6
  
  def role?(role)
    self.role.to_s == role.to_s
  end


  def self.artists
    joins(:songs).group('songs.user_id').having('count(*) > 0')
  end


  private
  def set_default_role
    self.role ||= "artist"
  end


  








end
