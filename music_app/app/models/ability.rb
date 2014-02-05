class Ability < ActiveRecord::Base
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, Song
      can :manage, User
      can :destroy, Comment

    elsif user.role? :artist  
      can :read, :all

      can :manage, Comment do |comment|
      comment.user == user
      end

      can :create, Comment 

      can :manage, Song do |song|
      song.user == user
      end

      can :create, Song 
      
      can :manage, User do |user_object|
      user_object == user
      end


    else
      can :read, :all
      can :create, User
    end
    

  end

end