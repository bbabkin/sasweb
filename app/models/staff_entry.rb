class StaffEntry < ActiveRecord::Base

  before_validation :add_default_link
  mount_uploader :photo1, ImageUploader # Tells rails to use this uploader for this model.
  validates_presence_of :name
  validates_presence_of :summary
  validates_presence_of :section
  #validates_length_of :name, :maximum => 255
  # use presence_of with length_of to disallow spaces
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink

  # for unique values by subject use ":scope => :subject_id"

  # scope :visible, lambda { where(:visible => true) }
  # scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("staff_entries.position ASC")}
  scope :newest_first, lambda { order("staff_entries.created_at DESC")}
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }
  private

  def add_default_link
    if permalink.blank?
      self.permalink = "#{name}"
    end
  end


end
