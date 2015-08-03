# -*- encoding : utf-8 -*-
class AddTeamPlace < ActiveRecord::Migration
  def self.up
    add_column :teams, :place, :integer
  end

  def self.down
    remove_column :teams, :place
  end
end
