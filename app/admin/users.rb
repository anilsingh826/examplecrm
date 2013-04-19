ActiveAdmin.register User do
  index do
    column :email
    column :first_name
    column :last_name
    column :roles do |user|
      user.roles.join(", ")
    end
    default_actions
  end
  
  show do
   attributes_table_for user do
     row :email
     row :first_name
     row :last_name
     row("roles") { |user| user.roles.join(", ") }
   end
  end
  
  form do |f|
    f.inputs "User edit" do
      f.input :first_name
      f.input :last_name
      f.input :email
      if f.object.id.nil?
        f.input :password,              :label => "Password"
	    f.input :password_confirmation, :label => "Password Confirmation"
      end 
      f.input :roles, :as => :check_boxes, :multiple => true, :collection => User::ROLES 
    end
    f.buttons
  end
  
end
