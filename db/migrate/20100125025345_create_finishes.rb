# -*- encoding : utf-8 -*-
class CreateFinishes < ActiveRecord::Migration
  def self.up
    create_table :finishes do |t|
      t.string :name
      t.integer :event_id, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :finishes
  end
end
