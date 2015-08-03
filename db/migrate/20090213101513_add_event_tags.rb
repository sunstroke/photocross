# -*- encoding : utf-8 -*-
class AddEventTags < ActiveRecord::Migration
  def self.up
    add_column :events, :cached_tag_list, :string, :null => false, :default => ""
  end

  def self.down
    remove_column :events, :cached_tag_list
  end
end
