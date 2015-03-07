class Header < ActiveRecord::Base

  #mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.
  validates_presence_of :name
  validates_presence_of :content

  #validates_length_of :name, :maximum => 255
  # use presence_of with length_of to disallow spaces


  # for unique values by subject use ":scope => :subject_id"

  # scope :visible, lambda { where(:visible => true) }
  # scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("headers.position ASC")}
  scope :newest_first, lambda { order("headers.created_at DESC")}
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }


end
