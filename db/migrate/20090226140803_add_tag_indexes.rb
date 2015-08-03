# -*- encoding : utf-8 -*-
class AddTagIndexes < ActiveRecord::Migration
  def self.up
    add_index :tags, :name, :unique => true
  end

  def self.down
    remove_index :tags, :name
  end
end
