# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def  show_thumbnail(album)
       image = album.images.rand
       image_tag image.photo.url(:small)
     rescue
  end
end
