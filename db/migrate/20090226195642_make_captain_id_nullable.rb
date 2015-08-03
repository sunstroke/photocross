# -*- encoding : utf-8 -*-
class MakeCaptainIdNullable < ActiveRecord::Migration
  def self.up
    change_column :teams, :captain_id, :integer, :null => true
  end

  def self.down
  end
end
