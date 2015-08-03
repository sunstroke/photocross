# -*- encoding : utf-8 -*-
class CreatePartnerEvents < ActiveRecord::Migration
  def self.up
    create_table :partner_events do |t|
      t.integer :partner_id
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :partner_events
  end
end
