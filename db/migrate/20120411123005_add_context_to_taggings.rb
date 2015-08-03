class AddContextToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :context, :string, :default=>"tags"
  end
 
end
