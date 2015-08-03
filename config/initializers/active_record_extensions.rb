# -*- encoding : utf-8 -*-
module ActiveRecordExtensions
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def ids(field = nil)
      attribute(field ||= "id").map{|id| id.to_i}
    end
    
    def attribute(field)
      connection.select_values(send(:construct_finder_sql, :select => field))
    end

    def attributes(fields)
      connection.send(:select_all, send(:construct_finder_sql, :select => fields))
    end
    
    def cache_id(prefix = nil)
      ActionController::RecordIdentifier.dom_class(self, prefix)
    end
  end
  
end

ActiveRecord::Base.class_eval do
  include ActiveRecordExtensions
  
  def cache_id(prefix = nil)
    ActionController::RecordIdentifier.dom_id(self, prefix)
  end
  
end
