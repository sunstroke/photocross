# -*- encoding : utf-8 -*-
#require 'mime/types'
class Photo < ActiveRecord::Base
  belongs_to :task
  belongs_to :team
  belongs_to :event
  
  validates_presence_of :task_id, :on => :create, :message => "^Не определилось задание"
  validates_presence_of :team_id, :on => :create, :message => "^Не определилась команда"
  
  validates_uniqueness_of :task_id, :scope => :team_id, :on => :create, :message => "must be unique"
  validate :unique_task_number
  mount_uploader :image, PhotoUploader, :mount_on => :image_file_name  
  # has_attached_file :image, :styles => { 
  #   :thumb => ["100x100#"],
  #   :large => ["800x800>"] },
  #   :convert_options =>{ :all=>"-auto-orient"},
  #   :path          => ":rails_root/public/assets/:attachment/:id_partition/:basename-:style.:extension",
  #   :url           => "/assets/:attachment/:id_partition/:basename-:style.:extension",
  #   :default_url   => "/images/missing-:attachment-:style.png"
  #validates_attachment_presence :image
  
  scope :for_tasks, lambda {|tasks| {:conditions => {:task_id => tasks.map(&:id)}}}
  
  before_validation :detect_team_and_task, :on=>:create
  
  before_create :set_event
  
  def set_event
    self.event_id = team && team.event_id
  end
  
  def detect_team_and_task
    return true unless event
    return true unless image && image.original_filename
    if match_data = /^(\d+)_(\d+)_(\d+)/.match(image.original_filename)
       self.team = event.teams.find_by_number(match_data[1].to_i)
       self.task = event.tasks.find_by_number_and_variant(match_data[2].to_i, match_data[3].to_i)
     elsif match_data = /^(\d+)_(\d+)/.match(image.original_filename)
       self.team = event.teams.find_by_number(match_data[1].to_i)
       self.task = event.tasks.find_by_number(match_data[2].to_i)
     end
  end
  
  def unique_task_number
    errors.add("task_id", "^Номер задания должен быть уникальным") if task && team && team.tasks.ids("number").include?(task.number) && !team.tasks.include?(task)
  end
end
