class Ability < ActiveRecord::Base
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all

    elsif user.role? :artist  
      can :read, :all

      can :manage, Song do |song|
      song.user == user
      end

      can :manage, User do |user_object|
      user_object == user
      end


    else
      can :read, :all
      can :create, User
    end
    

  end

end