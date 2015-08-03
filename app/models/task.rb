# -*- encoding : utf-8 -*-
class Task < ActiveRecord::Base
  belongs_to :event
  has_many :photos
  
  validates_presence_of :event_id, :on => :create, :message => "can't be blank"
  validates_presence_of :variant, :on => :create, :message => "can't be blank", :if => lambda {|t| t.variable?}
  validates_uniqueness_of :number, :scope => :event_id, :on => :create, :message => "must be unique", :if => lambda {|t| !t.variable?}
  validates_uniqueness_of :variant, :scope => [:event_id, :number], :on => :create, :message => "must be unique", :if => lambda {|t| t.variable?}
  validates_presence_of :number, :on => :create, :message => "can't be blank"
  validates_numericality_of :number, :on => :create, :message => "должен быть числом"
  validates_numericality_of :variant, :on => :create, :message => "должен быть числом", :if => lambda {|t| t.variable?}
  
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_length_of :title, :within => 3..100, :on => :create, :message => "must be present"

  scope :numbered, :order => "number ASC"
end
