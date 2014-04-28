class CreateUsers < ActiveRecord::Migration
  def up
  	#In case if we don't want id to be mentioned, use this
  	#create_table :users , {:id => false} do |t|
    create_table :users do |t|
    	t.column "first_name", :string, :limit => 25
    	t.string "last_name", :limit =>50
    	t.string "email", :default => "", :null => false
    	t.string "password", :limit => 40

      t.timestamps
    end
  end


  def down
  	drop_table :users
  end

end
