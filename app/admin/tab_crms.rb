ActiveAdmin.register TabCrm do
  index do
    column :tab_name
    column :tab_link
    column :roles do |tab_crm|
      tab_crm.roles.join(", ")
    	end
    default_actions
  end
  
  show do
   attributes_table_for tab_crm do
     row :tab_name
     row :tab_link
     row("roles") { |tab_crm| tab_crm.roles.join(", ") }
   end
  end
  form do |f|
    f.inputs do
      f.input :tab_name
      f.input :tab_link
      f.input :roles, :as => :check_boxes, :multiple => true, :collection => TabCrm::ROLES 
    end
    f.buttons
  end
end
