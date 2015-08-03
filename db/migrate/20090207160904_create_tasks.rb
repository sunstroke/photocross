# -*- encoding : utf-8 -*-
class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :event_id, :null => false
      t.integer :number, :null => false
      t.string :title, :null => false
      t.boolean :required, :null => false, :default => true
      t.boolean :variable, :null => false, :default => false  
      t.integer :variant
      t.string :body

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
