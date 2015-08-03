# -*- encoding : utf-8 -*-
class CreateEventPhotos < ActiveRecord::Migration
  def self.up
    create_table :event_photos do |t|
      t.integer :user_id, :null => false
      t.integer :event_id, :null => false
      t.integer :photo_category_id, :null => false
      t.string :image_file_name

      t.timestamps
    end
    
    add_foreign_key  :on => :event_photos, :references => :users
    add_foreign_key  :on => :event_photos, :references => :events
    add_foreign_key  :on => :event_photos, :references => :photo_categories
    
    add_index :event_photos, [:event_id, :photo_category_id]
  end

  def self.down
    drop_table :event_photos
  end
end
