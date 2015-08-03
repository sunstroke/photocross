# -*- encoding : utf-8 -*-
class AddTeamsNumbers < ActiveRecord::Migration
  def self.up
    add_column :teams, :number, :integer
    Event.all.each do |event|
      event.team_ids.each_with_index do |team_id, index|
        Team.update_all({:number => index+1}, {:id => team_id})
      end
    end
  end

  def self.down
    remove_column :teams, :number
  end
end
