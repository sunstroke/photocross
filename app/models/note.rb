# -*- encoding : utf-8 -*-
class Note < ActiveRecord::Base
  belongs_to :event
  scope :recent, :order => "date DESC"
end
