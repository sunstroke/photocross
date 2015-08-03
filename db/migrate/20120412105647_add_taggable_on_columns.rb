class AddTaggableOnColumns < ActiveRecord::Migration
  def self.up 
     add_column :taggings, :tagger_id, :integer 
     add_column :taggings, :tagger_type, :string 

     remove_index :taggings, [:taggable_type,:taggable_id ,:tag_id] 

     # we need to set the context for exisiting tags 
     execute "UPDATE taggings SET context = 'tags'" 

     add_index :taggings, [:taggable_id, :taggable_type, :context] 
   end 

   def self.down 
     remove_index :taggings, [:taggable_id, :taggable_type, :context] 
     remove_column :taggings, :tagger_id 
     remove_column :taggings, :tagger_type 
     remove_column :taggings, :context 
     add_index :taggings, [:taggable_type,:taggable_id ,:tag_id] 
   end
end
