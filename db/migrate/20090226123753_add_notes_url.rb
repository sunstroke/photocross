# -*- encoding : utf-8 -*-
class AddNotesUrl < ActiveRecord::Migration
  def self.up
    add_column :notes, :url, :string
  end

  def self.down
    remove_column :notes, :url
  end
end
