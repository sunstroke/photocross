# -*- encoding : utf-8 -*-
class PhotoCategory < ActiveRecord::Base
  belongs_to :event
  has_many :event_photos, :dependent => :destroy
  
  validates_presence_of :name, :message => "can't be blank"
  validates_length_of :name, :within => 3..100, :message => "must be present"
  validates_presence_of :event_id, :message => "can't be blank"
  validates_uniqueness_of :name, :scope => :event_id, :message => "must be unique"
end
