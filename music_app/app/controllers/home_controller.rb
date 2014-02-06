class HomeController < ApplicationController
  def index
    @users = User.artists.order('created_at desc').limit(8)
    @songs = Song.order('created_at desc').limit(8)
    @comments = Comment.order('created_at desc').limit(5)
    # @tags = ActsAsTaggableOn::Tag.all(:order=>'name')
    @tags = User.tag_counts_on(:tags).order('count desc').limit(50)



    
  end

end