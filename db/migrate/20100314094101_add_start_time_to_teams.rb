# -*- encoding : utf-8 -*-
class AddStartTimeToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :starttime, :datetime
    add_column :teams, :finishtime, :datetime
    add_column :teams, :status, :string
    add_column :teams, :sostav, :string
  end

  def self.down
    remove_column :teams, :sostav
    remove_column :teams, :status
    remove_column :teams, :finishtime
    remove_column :teams, :starttime
  end
end
