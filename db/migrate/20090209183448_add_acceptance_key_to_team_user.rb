# -*- encoding : utf-8 -*-
class AddAcceptanceKeyToTeamUser < ActiveRecord::Migration
  def self.up
    add_column :team_users, :accept_key, :string
  end

  def self.down
    remove_column :team_users, :accept_key
  end
end
