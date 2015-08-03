# -*- encoding : utf-8 -*-
class RenameTeams < ActiveRecord::Migration
  def self.up
    rename_table :event_teams, :teams
    rename_column :teams, :team_id, :meta_team_id
    
    rename_column :team_users, :team_id, :meta_team_id
    rename_column :team_users, :event_team_id, :team_id
  end

  def self.down
  end
end
