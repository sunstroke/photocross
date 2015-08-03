# -*- encoding : utf-8 -*-
class CreatePhotoCategories < ActiveRecord::Migration
  def self.up
    create_table :photo_categories do |t|
      t.integer :event_id, :null => false
      t.string :name, :null => false

      t.timestamps
    end
    add_foreign_key :on => :photo_categories, :references => :events
    add_index :photo_categories, :event_id
  end

  def self.down
    drop_table :photo_categories
  end
end
