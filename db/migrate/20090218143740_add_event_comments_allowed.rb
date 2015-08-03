# -*- encoding : utf-8 -*-
class AddEventCommentsAllowed < ActiveRecord::Migration
  def self.up
    add_column :events, :comment_allowed, :boolean, :default => true, :null => false
  end

  def self.down
    remove_column :events, :comment_allowed
  end
end
