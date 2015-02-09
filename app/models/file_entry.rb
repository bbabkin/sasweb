class FileEntry < ActiveRecord::Base

  before_validation :add_default_link
  mount_uploader :file, FileUploader # Tells rails to use this uploader for this model.
  attr_accessor :is_image
  attr_accessor :is_video
  attr_accessor :is_pdf
  attr_accessor :is_other
  validates_presence_of :name
  validates_presence_of :file_type
  #validates_length_of :name, :maximum => 255
  # use presence_of with length_of to disallow spaces
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink

  # for unique values by subject use ":scope => :subject_id"

  # scope :visible, lambda { where(:visible => true) }
  # scope :invisible, lambda { where(:visible => false) }
  scope :newest_first, lambda { order("file_entries.created_at DESC")}
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

