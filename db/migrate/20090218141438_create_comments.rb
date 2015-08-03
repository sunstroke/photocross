# -*- encoding : utf-8 -*-
class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :event_id, :null => false
      t.integer :user_id, :null => false
      t.string :body, :limit => 2000

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
