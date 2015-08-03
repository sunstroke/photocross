# -*- encoding : utf-8 -*-
class CreateEventTeams < ActiveRecord::Migration
  def self.up
    create_table :event_teams do |t|
      t.integer :event_id, :null => false
      t.integer :team_id
      t.string :title, :null => false
      t.integer :captain_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :event_teams
  end
end
