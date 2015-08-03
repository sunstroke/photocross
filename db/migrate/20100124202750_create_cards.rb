# -*- encoding : utf-8 -*-
class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :card_num
      t.string :pin
      t.integer :team_id
      t.boolean :activated

      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
