class HomeController < ApplicationController
  def index
    @users = User.all
    @songs = Song.all
    @comments = Comment.all
    @tags = ActsAsTaggableOn::Tag.all(:order=>'name')



    
  end

end