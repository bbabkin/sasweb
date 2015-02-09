class EventItem < ActiveRecord::Base

  before_validation :add_default_link
  #mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.
  validates_presence_of :short_entry
  validates_presence_of :long_entry
  #validates_length_of :name, :maximum => 255
  # use presence_of with length_of to disallow spaces
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink

  # for unique values by subject use ":scope => :subject_id"

  # scope :visible, lambda { where(:visible => true) }
  # scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("event_items.position ASC")}
  scope :newest_first, lambda { order("event_items.created_at DESC")}
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }
  private

  def add_default_link
    if permalink.blank?
      self.permalink = "event-#{created_at.to_date}-#{self.created_at.hour.to_i}-#{self.created_at.min.to_i}"
    end
  end



end
