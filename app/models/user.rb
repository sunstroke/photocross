# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :login, :email, :password, :password_confirmation, :providers_attributes
  authenticates_with_sorcery!
  
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  has_many :team_users
  has_many :teams, :through => :team_users
  has_many :events, :through => :team_users
  
  has_many :ruled_teams, :class_name => "Team", :foreign_key => "captain_id"  
  scope :accepted, :conditions => {"team_users.accepted" => true}
  
  scope :lookup, lambda {|query| 
    {:conditions => ["login LIKE :query OR email LIKE :query", {:query => "#{query}%"}]}
  }
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.password_reset_instructions(self).deliver
  end
  
  def participate?(event)
    team_users.exists?(:event_id => event) || 
    ruled_teams.exists?(:event_id => event)
  end
  
  def not_openid?
    identity_url.blank?
  end
end
