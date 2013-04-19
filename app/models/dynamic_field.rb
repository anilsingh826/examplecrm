class DynamicField < ActiveRecord::Base
  attr_accessible :roles, :model_name, :name, :type
  
  ROLES = %w[admin client tech]
  DATA_TYPES = [
      ["Text","string_type"],
      ["Paragraph text","text_type"],
      ["Radio buttons", "radio_type"],
      ["Checkboxes", "check_boxes_type"],
      ["Integer", "integer_type"],
      ["Boolean", "boolean_type"],
      ["Float", "float_type"]
    ]
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
  
  def roles=(roles)
    self.field_role = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((field_role || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def is?(role)
    roles.include?(role.to_s)
  end
end
