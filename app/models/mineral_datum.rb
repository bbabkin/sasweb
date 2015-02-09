class MineralDatum < ActiveRecord::Base


  #mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.
  validates_presence_of :mine_name
  validates_presence_of :mine_data
  validates_presence_of :data_type
  #validates_length_of :name, :maximum => 255
  # use presence_of with length_of to disallow spaces


  # for unique values by subject use ":scope => :subject_id"

  # scope :visible, lambda { where(:visible => true) }
  # scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("mineral_data.position ASC")}
  scope :newest_first, lambda { order("mineral_data.created_at DESC")}
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }


end
