# -*- encoding : utf-8 -*-
class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :url
      t.string :cached_tag_list
      t.datetime :date
      t.integer :event_id
      t.integer :author_id

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
