class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    # GUEST - role is NULL ---> Guest, not logged in 
    if @user.role.nil?
      # Public Permissions:
      # can :read, Page
    else
     send(@user.role.to_sym)  
    end
  end
  
  def user
    # Logged in user permissions:
    #can :read, Page
  end  
  
  def manager
    user # Inherit user permissions, and add more:
    #can :manage, Page
  end
  
  def superuser
    can :manage, :all
  end    
end
