class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user

    alias_action :create, :read, :update, :destroy, :to => :crud
   

   	can :manage, :all if user.role == "admin"
   	can :read, :all if user.role == "student" 
 
 	end
end