class Comment < ActiveRecord::Base
  attr_accessible :comment, :song_id, :user_id

  belongs_to :user
  belongs_to :song

  validates :comment, presence: true
  validates_length_of :comment, :maximum => 1000, :message => "less than 1000 characters if you don't mind"
  validates_length_of :comment, :minimum => 1, :message => "blank comments are not accepted"

 


  

end
