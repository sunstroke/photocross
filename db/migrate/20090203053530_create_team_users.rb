# -*- encoding : utf-8 -*-
class CreateTeamUsers < ActiveRecord::Migration
  def self.up
    create_table :team_users do |t|
      t.integer :event_team_id
      t.integer :user_id, :null => false
      t.integer :team_id
      t.integer :event_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :team_users
  end
end
