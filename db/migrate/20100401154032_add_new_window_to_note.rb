# -*- encoding : utf-8 -*-
class AddNewWindowToNote < ActiveRecord::Migration
  def self.up
    add_column :notes, :in_new, :boolean
  end

  def self.down
    remove_column :notes, :in_new
  end
end
