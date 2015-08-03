# -*- encoding : utf-8 -*-
class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :image_file_name
      t.integer :team_id
      t.integer :task_id
      t.integer :event_id
      t.decimal :mark

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
