class Comment < ActiveRecord::Base
  attr_accessible :comment, :song_id, :user_id
end
