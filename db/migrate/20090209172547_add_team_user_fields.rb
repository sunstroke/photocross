# -*- encoding : utf-8 -*-
class AddTeamUserFields < ActiveRecord::Migration
  def self.up
    add_column :team_users, :accepted, :boolean
    Team.all.each do |team|
      team_user = team.team_users.find_or_initialize_by_user_id(team.captain_id)
      team_user.accepted = true
      team_user.save
    end
  end

  def self.down
    remove_column :team_users, :accepted
  end
end
