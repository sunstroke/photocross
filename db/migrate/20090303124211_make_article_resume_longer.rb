# -*- encoding : utf-8 -*-
class MakeArticleResumeLonger < ActiveRecord::Migration
  def self.up
    change_column :articles, :resume, :text
  end

  def self.down
    change_column :articles, :resume, :string, :limit => 500
  end
end
