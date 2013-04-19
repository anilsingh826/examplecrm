class CreateTabCrms < ActiveRecord::Migration
  def change
    create_table :tab_crms do |t|
      t.string  :tab_name
      t.string :tab_link
      t.integer :tab_role
      t.timestamps
    end
  end
end
