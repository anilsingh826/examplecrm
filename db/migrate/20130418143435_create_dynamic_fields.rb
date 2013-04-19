class CreateDynamicFields < ActiveRecord::Migration
  def change
    create_table :dynamic_fields do |t|
      t.integer :field_role
      t.string :model_name
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
