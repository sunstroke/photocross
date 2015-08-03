# -*- encoding : utf-8 -*-
class Article < ActiveRecord::Base
  scope :recent, :order => "created_at DESC"
  acts_as_taggable
  belongs_to :author, :class_name => "User"
  validates_uniqueness_of :permalink, :message => "must be unique", :allow_nil => true
  
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_length_of :title, :within => 3..200, :on => :create, :message => "must be present"
  validates_presence_of :author_id, :on => :create, :message => "can't be blank"
  
  scope :recent, :order => "articles.created_at DESC"
  
  def to_param
    "#{id}-#{title.to_s.parameterize}"
  end
end
