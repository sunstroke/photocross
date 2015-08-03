# -*- encoding : utf-8 -*-
class ActiveRecord::Base
  scope :limit, lambda{|limit| {:limit => limit}}
end
