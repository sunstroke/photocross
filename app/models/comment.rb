# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  
  validates_presence_of :user_id, :message => "can't be blank"
  validates_presence_of :event_id, :message => "can't be blank"
  validate :event_comment_allowed
  
  scope :recent, :order => "created_at DESC"
  
  def event_comment_allowed
    errors.add_on_base("Комментарии нельзя оставлять") if event && !event.comment_allowed?
  end
end
