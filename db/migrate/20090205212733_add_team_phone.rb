# -*- encoding : utf-8 -*-
class AddTeamPhone < ActiveRecord::Migration
  def self.up
    add_column :teams, :phone, :string
  end

  def self.down
    remove_column :teams, :phone
  end
end
