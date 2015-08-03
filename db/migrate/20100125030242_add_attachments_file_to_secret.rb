# -*- encoding : utf-8 -*-
class AddAttachmentsFileToSecret < ActiveRecord::Migration
  def self.up
    add_column :secrets, :file_file_name, :string
    add_column :secrets, :file_content_type, :string
    add_column :secrets, :file_file_size, :integer
    add_column :secrets, :file_updated_at, :datetime
  end

  def self.down
    remove_column :secrets, :file_file_name
    remove_column :secrets, :file_content_type
    remove_column :secrets, :file_file_size
    remove_column :secrets, :file_updated_at
  end
end
