# -*- encoding : utf-8 -*-
class AddArticleResume < ActiveRecord::Migration
  def self.up
    add_column :articles, :resume, :string, :limit => 400
  end

  def self.down
    remove_column :articles, :resume
  end
end
