# -*- encoding : utf-8 -*-
class CreateSecrets < ActiveRecord::Migration
  def self.up
    create_table :secrets do |t|
      t.string :name
      t.integer :event_id, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :secrets
  end
end
