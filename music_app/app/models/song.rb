class Song < ActiveRecord::Base
  attr_accessible :about, :image, :lyrics, :title, :user_id
  belongs_to :user

  validates :title, presence: true

end
