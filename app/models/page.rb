class Page < ActiveRecord::Base

	belongs_to :subject
	has_and_belongs_to_many :editors , :class_name => "AdminUser"


	#Key Tip, the foreign key always goes to the
	# belongs_to 
end
