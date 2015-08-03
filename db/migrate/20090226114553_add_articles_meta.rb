# -*- encoding : utf-8 -*-
class AddArticlesMeta < ActiveRecord::Migration
  def self.up
    add_column :articles, :keywords, :string
    add_column :articles, :description, :string
    add_column :events, :keywords, :string
    add_column :events, :description, :string
  end

  def self.down
    remove_column :articles, :keywords
    remove_column :articles, :description
    remove_column :events, :keywords
    remove_column :events, :description
  end
end
