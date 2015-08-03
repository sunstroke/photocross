# -*- encoding : utf-8 -*-
class RenameArticleUrl < ActiveRecord::Migration
  def self.up
    rename_column :articles, :url, :permalink
    add_column :articles, :body_html, :text
  end

  def self.down
    rename_column :articles, :permalink, :url
    remove_column :articles, :body_html
  end
end
