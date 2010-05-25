class CreateAlbumImages < ActiveRecord::Migration
  def self.up
    create_table :album_images do |t|
      t.integer :image_id
      t.integer :album_id

      t.timestamps
    end
  end

  def self.down
    drop_table :album_images
  end
end
