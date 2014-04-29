class CreateSectionModels < ActiveRecord::Migration
  def  up
    create_table :section_models , :id => false do |t|
    	t.references :admin_user
    	t.references :section_models
    	t.string :summery

      t.timestamps
    end
    add_index :section_edits, ["admin_user_id", "section_id"]
  end

  def down
  	drop_table :section_edit
end
