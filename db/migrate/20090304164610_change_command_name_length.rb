# -*- encoding : utf-8 -*-
class ChangeCommandNameLength < ActiveRecord::Migration
  def self.up
    change_column :teams, :title, :string, :null => false, :length => 400
  end

  def self.down
    change_column :teams, :title, :string, :null => false
  end
end
