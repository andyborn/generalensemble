class Ability < ActiveRecord::Base
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, Song
      can :manage, User
      can :read, Comment
      can :destroy, Comment
      can :flag, Comment
      can :changeflag, Comment
      can :tagged, :all

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

      can :flag, Comment
      can :tagged, :all

    else
      can :read, :all
      can :tagged, :all
      can :create, User
    end
    

  end

end