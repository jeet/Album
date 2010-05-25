class Image < ActiveRecord::Base
#  has_many :attachments, :class_name => '::Attachment'
  has_many :album_images
  has_many :albums, :through => :album_images
  
 validates_presence_of :title
  validates_uniqueness_of :title
  validates_attachment_presence :photo


  has_attached_file :photo,
  :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :medium => "300x300>",
    :large =>   "400x400>" }

end
