class Album < ActiveRecord::Base
  has_many :album_images
  has_many :images , :thorugh => :album_images
  validates_presence_of :title
  validates_uniqueness_of :title

end
