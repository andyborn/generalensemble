class HomeController < ApplicationController
  def index
    @users = User.all
    @songs = Song.all

    
  end




end