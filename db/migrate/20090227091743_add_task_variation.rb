# -*- encoding : utf-8 -*-
class AddTaskVariation < ActiveRecord::Migration
  def self.up
    add_column :tasks, :variable_title, :string
  end

  def self.down
    add_task :tasks, :variable_title
  end
end
