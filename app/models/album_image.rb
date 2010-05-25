class AlbumImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :album
end
