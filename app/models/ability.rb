class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.roles.size != 0
      if user.roles.include?("admin")
        can :manage, :all
      end
      
	  if user.roles.include?("client")
	    can :read, TabCrm do |tab_crm|
	      tab_crm.roles.include?("client")
        end
	  end
	  if user.roles.include?("tech")
	    can :read, TabCrm do |tab_crm|
	      tab_crm.roles.include?("tech")
        end
	  end
	end  
  end
end
