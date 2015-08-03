# -*- encoding : utf-8 -*-
class CreateSmiEvents < ActiveRecord::Migration
  def self.up
    create_table :smi_events do |t|
      t.integer :smi_id
      t.integer :event_id
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :smi_events
  end
end
