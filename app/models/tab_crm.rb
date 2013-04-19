class TabCrm < ActiveRecord::Base
   attr_accessible :tab_name, :tab_link, :roles
     ROLES = %w[admin client tech]
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
  
  def roles=(roles)
    self.tab_role = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((tab_role || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def is?(role)
    roles.include?(role.to_s)
  end
end
