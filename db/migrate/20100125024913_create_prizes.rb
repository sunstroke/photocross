# -*- encoding : utf-8 -*-
class CreatePrizes < ActiveRecord::Migration
  def self.up
    create_table :prizes do |t|
      t.string :name
      t.integer :event_id, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :prizes
  end
end
