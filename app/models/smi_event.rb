# -*- encoding : utf-8 -*-
class SmiEvent < ActiveRecord::Base
  belongs_to :smi
  belongs_to :event
end
