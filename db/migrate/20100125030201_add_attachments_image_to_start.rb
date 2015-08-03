# -*- encoding : utf-8 -*-
class AddAttachmentsImageToStart < ActiveRecord::Migration
  def self.up
    add_column :starts, :image_file_name, :string
    add_column :starts, :image_content_type, :string
    add_column :starts, :image_file_size, :integer
    add_column :starts, :image_updated_at, :datetime
  end

  def self.down
    remove_column :starts, :image_file_name
    remove_column :starts, :image_content_type
    remove_column :starts, :image_file_size
    remove_column :starts, :image_updated_at
  end
end
