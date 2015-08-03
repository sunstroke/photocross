# -*- encoding : utf-8 -*-
class ActsAsTaggableMigration < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.column :name, :string, :null => false
    end
    
    create_table :taggings do |t|
      t.column :tag_id, :integer, :null => false
      t.column :taggable_id, :integer, :null => false
      
      # You should make sure that the column created is
      # long enough to store the required class names.
      t.column :taggable_type, :string, :limit => 40, :null => false
      
      t.column :created_at, :datetime
    end
    
    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_type, :taggable_id, :tag_id], :unique => true
    add_foreign_key :on => :taggings, :references => :tags
  end
  
  def self.down
    drop_table :taggings
    drop_table :tags
  end
end
