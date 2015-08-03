# -*- encoding : utf-8 -*-
class AddTeamResult < ActiveRecord::Migration
  def self.up
    add_column :teams, :penalty, :decimal
    add_column :teams, :result, :decimal
  end

  def self.down
    remove_column :teams, :penalty
    remove_column :teams, :result
  end
end
