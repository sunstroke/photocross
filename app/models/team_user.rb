# -*- encoding : utf-8 -*-
class TeamUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :meta_team
  belongs_to :event
  
  validates_presence_of :user_id, :on => :create, :message => "^Пользователь должен быть указан"
  validates_presence_of :team_id, :on => :create, :message => "^Команда должна быть указана"
  validates_presence_of :event_id, :on => :create, :message => "^Событие должно быть указано"
  
  before_validation :set_event, :on=>:create
  before_validation :set_team, :on=>:create
  
  validates_uniqueness_of :user_id, :scope => :team_id, :on => :create, :message => "вы уже участвуете"
  validate :only_one_user_per_event
  
  before_create :set_accept_key
  after_create :deliver_email
  
  scope :accepted, :conditions => {:accepted => true}
  
  def set_event
    self.event ||= team && team.event
  end

  def set_team
    self.team ||= team && team.team
  end
  
  def login
    user && user.login
  end
  
  def login=(login)
    self.user = login && User.find_by_login(login)
  end
  
  def set_accept_key
    self.accept_key = Digest::SHA1.hexdigest("#{user_id}#{team_id}#{user.crypted_password}") if self.accepted.nil?
  end
  
  def only_one_user_per_event
    other_team_user = event.team_users.find(:first, :conditions => ["accepted = ? AND user_id = ? AND id != ?", true, user_id, id])
    errors.add("accepted", "^Вы можете участвовать только в одной команде") if other_team_user
  end
  
  def deliver_email
    Notifier.team_invitation(self).deliver if self.accept_key
  end
end
