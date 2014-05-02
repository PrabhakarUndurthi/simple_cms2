class Page < ActiveRecord::Base

  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"


  #validates :name
  validates_uniqueness_of :name
  validates  :name, length: { minimum: 4, maximum: 10}
  validates_presence_of :content 

  validates_presence_of :permalink, :within => 3..225
  validates_uniqueness_of :permalink


  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda { order("pages.created_at DESC")}

end