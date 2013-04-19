ActiveAdmin.register DynamicField do
  index do
    column :name
    column :type
    column :model_name
    column :roles do |dynamic_field|
      dynamic_field.roles.join(", ")
    end
    default_actions
  end
  
  show do
   attributes_table_for dynamic_field do
     row :name
     row :type
     row :model_name
     row("roles") { |dynamic_field| dynamic_field.roles.join(", ") }
   end
  end
  
  form do |f|
    f.inputs "Dynamic Field" do
      f.input :name
      f.input :type
      f.input :model_name, :as => :select, :label => "Model Name", :collection => Dir['app/models/*.rb'].map {|f| File.basename(f, '.*').camelize.constantize.name }
      f.input :roles, :as => :check_boxes, :multiple => true, :collection => DynamicField::ROLES
    end
    f.buttons
  end
  
end
