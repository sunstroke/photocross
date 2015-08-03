# -*- encoding : utf-8 -*-
class ChangeSomeFields < ActiveRecord::Migration
  def self.up
    add_column :events, :finishing_at, :datetime
    remove_column :tasks, :body
  end

  def self.down
    add_column :tasks, :body, :text
    remove_column :events, :finishing_at
  end
end
