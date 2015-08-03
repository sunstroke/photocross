# -*- encoding : utf-8 -*-
class AddForeignKeys < ActiveRecord::Migration
  def self.up
    if false
    add_foreign_key true, :on => :team_users, :references => :teams
    add_foreign_key true, :on => :team_users, :references => :users
    add_foreign_key true, :on => :team_users, :references => :events
    add_foreign_key true, :on => :teams, :references => :events
    add_foreign_key true, :on => {:table => :teams, :column => :captain_id}, :references => :users
    add_foreign_key true, :on => :tasks, :references => :events
    end
  end

  def self.down
  end
end
