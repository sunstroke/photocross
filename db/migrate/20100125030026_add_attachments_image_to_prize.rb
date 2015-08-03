# -*- encoding : utf-8 -*-
class AddAttachmentsImageToPrize < ActiveRecord::Migration
  def self.up
    add_column :prizes, :image_file_name, :string
    add_column :prizes, :image_content_type, :string
    add_column :prizes, :image_file_size, :integer
    add_column :prizes, :image_updated_at, :datetime
  end

  def self.down
    remove_column :prizes, :image_file_name
    remove_column :prizes, :image_content_type
    remove_column :prizes, :image_file_size
    remove_column :prizes, :image_updated_at
  end
end
