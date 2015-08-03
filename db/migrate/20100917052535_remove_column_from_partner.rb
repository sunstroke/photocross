# -*- encoding : utf-8 -*-
class RemoveColumnFromPartner < ActiveRecord::Migration
  def self.up
        remove_column :partners, :event_id
        remove_column :smis, :event_id        
  end

  def self.down

  end
end
