# -*- encoding : utf-8 -*-
class MakeResumeLonger < ActiveRecord::Migration
  def self.up
    change_column :events, :resume, :text
  end

  def self.down
    change_column :events, :resume, :string, :limit => 500
  end
end
