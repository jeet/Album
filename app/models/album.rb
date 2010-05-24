class Album < ActiveRecord::Base
  has_many :images
  validates_presence_of :title
  validates_uniqueness_of :title

end
