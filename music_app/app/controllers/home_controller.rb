class HomeController < ApplicationController
  def index
    @users = User.all
    @songs = Song.all
    @comments = Comment.all



    
  end

end