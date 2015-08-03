# -*- encoding : utf-8 -*-
class AddEventResume < ActiveRecord::Migration
  def self.up
    add_column :events, :resume, :string, :limit => 500
  end

  def self.down
    remove_column :events, :resume
  end
end
