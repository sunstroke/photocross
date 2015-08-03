class Feedback < ActiveRecord::Base
  attr_accessible :email, :message, :name
end
