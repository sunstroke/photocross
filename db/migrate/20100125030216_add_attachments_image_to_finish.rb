# -*- encoding : utf-8 -*-
class AddAttachmentsImageToFinish < ActiveRecord::Migration
  def self.up
    add_column :finishes, :image_file_name, :string
    add_column :finishes, :image_content_type, :string
    add_column :finishes, :image_file_size, :integer
    add_column :finishes, :image_updated_at, :datetime
  end

  def self.down
    remove_column :finishes, :image_file_name
    remove_column :finishes, :image_content_type
    remove_column :finishes, :image_file_size
    remove_column :finishes, :image_updated_at
  end
end
