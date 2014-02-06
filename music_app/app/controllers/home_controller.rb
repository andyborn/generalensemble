class HomeController < ApplicationController
  def index
    @users = User.artists
    @songs = Song.all
    @comments = Comment.all
    @tags = ActsAsTaggableOn::Tag.all(:order=>'name')



    
  end

end