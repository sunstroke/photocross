# -*- encoding : utf-8 -*-
class Team < ActiveRecord::Base
  belongs_to :event
  belongs_to :captain, :class_name => "User"
  has_many :team_users, :dependent => :destroy
  has_many :users, :through => :team_users
  has_many :photos, :dependent => :destroy
  has_many :tasks, :through => :photos
  has_one :card
  
  validates_uniqueness_of :title, :message => "^Такая команда уже заявилась на это событие", :scope => :event_id
  validates_presence_of :title, :message => "^Название команды должно быть указано"
  validates_length_of :title, :within => 2..400, :message => "^Название команды должно быть от 2 до 40 символов в длину"
  #validates_presence_of :captain_id, :message => "^Команда не может быть без капитана"
  
  validates_acceptance_of :license_confirmation, :on => :create, :message => "^Необходимо подтвердить пользовательское соглашение"
  
  validate :uniqueness_of_captain_team , :on=> :create
  
  scope :placed, :order => "place ASC"
  
  attr_accessor :invited_users
  
  before_create :set_number
  after_create :invite_users
  after_create :add_captain
  
  def card_num
    self.card.card_num if card
  end
  
  def card_num=(card_num)
    self.card = Card.find_by_card_num(card_num) unless card_num.blank?
  end
  
  def captain_login
    captain && captain.login
  end
  
  def captain_login=(login)
    self.captain = User.find_by_login(login)
  end
  
  def set_number
    #self.number ||= event.teams.ids("COALESCE(MAX(number), 0)+1").first
    #self.number ||= (event.teams.ids.max||0)+1
    self.number ||= (event.teams.ids("number").max||0)+1    
    self.sostav=invited_users
  end
  
  def invite_users
    return if invited_users.blank?
    invited_users.split(/[, ]/).reject(&:blank?).each do |login|
      user = User.find_by_login(login) || User.find_by_email(login)
      team_users.create(:user => user) if user
    end
  end
  
  def add_captain
    team_users.create(:user => captain, :accepted => true)
  end
  
  def uniqueness_of_captain_team
    if captain && captain.ruled_teams.exists?(:event_id => event_id)
      logger.debug captain.inspect
      errors.add("captain_id", "^Капитан может участвовать только в одной команде")
    end
  end
  
  def photo_for_task(task)
    photos.find {|photo| photo.task && photo.task.number == task.number}
  end
end
