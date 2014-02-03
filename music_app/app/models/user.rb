class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :artist_image, :artist_name, :bio, :email, :password, :website, :password_confirmation

  validates :password, presence: true, on: :create

  validates :email, presence: true

  validates :email, uniqueness: true

  validates :artist_name, uniqueness: true

  validates :artist_name, presence: true

  validates_length_of :bio, :maximum => 1000, :message => "less than 1000 characters if you don't mind"
end
