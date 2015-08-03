# -*- encoding : utf-8 -*-
class AddEventFields < ActiveRecord::Migration
  def self.up
    add_column :events, :handled_at, :datetime
    add_column :events, :image_file_name, :string
  end

  def self.down
    remove_column :events, :image_file_name
    remove_column :events, :handled_at
  end
end
