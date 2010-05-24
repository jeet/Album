class Album < ActiveRecord::Base
  has_many :images
  validates_presence_of :title, :short_name
  validates_uniqueness_of :title, :short_name

end
