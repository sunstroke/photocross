# -*- encoding : utf-8 -*-
module ActiveRecord
  module ConnectionAdapters
    class SQLite3Adapter
      def initialize(*args)
        Rails.logger.debug "Adding group_concat to SQLite database"
        super
        raw_connection.create_aggregate("group_concat", 2) do
          step do |func, value, separator|
            if String(func[:concat]).empty? then
              func[:concat] = String(value)
            else
              func[:concat] = String(func[:concat]) + "#{separator}" + String(value)
            end
          end

          finalize do |func|
            func.result = func[:concat]
          end
        end
      end
    end
  end
end
