class AdminController < ApplicationController
  def index
    unless current_user && current_user.role == "admin"
    redirect_to root_path, alert: "You do not have permission to view that page!"
    end

    @users = User.all
    @songs = Song.all
    @comments = Comment.all



    
  end

end