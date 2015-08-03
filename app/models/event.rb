# -*- encoding : utf-8 -*-
class Event < ActiveRecord::Base
  has_many :teams, :dependent => :destroy,:order=>"number"
  has_many :tasks, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :team_users, :dependent => :destroy
  has_many :notes, :dependent => :nullify
  has_many :comments, :dependent => :destroy
  has_many :photo_categories, :dependent => :destroy
  has_many :prizes, :dependent => :destroy
  has_many :partner_events
  has_many :partners , :through => :partner_events
  has_many :smi_events
  has_many :smis, :through => :smi_events
  #has_many :smis
  has_many :pressrelises
  has_many :starts, :dependent => :destroy
  has_many :finishes, :dependent => :destroy
  has_many :secrets, :dependent => :destroy
  
  validates_presence_of :title, :message => "^Название события должно быть указано"    
  scope :recent, :order => "events.handled_at DESC"
  scope :year, lambda {|year| 
    {:conditions => ["handled_at >= ? AND handled_at < ?", 
      Time.mktime(year, 1, 1).beginning_of_year,
      Time.mktime(year, 1, 1).end_of_year]}}
  scope :awaiting, lambda { {:order => "events.handled_at ASC", 
    :conditions => ["events.handled_at >= ? OR events.finishing_at >= ?", 
      Time.now.beginning_of_day, Time.now.beginning_of_day]}}
      
  def self.years
   # scoped(:group => "year").ids("date_part('year', handled_at) AS year").select {|year| year > 0}.sort.reverse
     scoped(:group => "year").ids("strftime('%Y', handled_at) AS year").select {|year| year > 0}.sort.reverse
  end
  acts_as_taggable
  
  # def to_param
  #   "#{id}-#{title.parameterize}"
  # end
  def start_attributes=(start_attributes)
    if !start_attributes["name"].blank? 
      starts.build(start_attributes)
    end
  end
  def finish_attributes=(finish_attributes)
    if !finish_attributes["name"].blank? 
      finishes.build(finish_attributes)
    end
  end
  def prize_attributes=(prize_attributes)
    if !prize_attributes["name"].blank? 
      prizes.build(prize_attributes)
    end
  end
  def pressrelise_attributes=(pressrelise_attributes)
    if !pressrelise_attributes["name"].blank? 
      pressrelises.build(pressrelise_attributes)
    end
  end

  
  mount_uploader :image, EventUploader, :mount_on => :image_file_name
  # has_attached_file :image, :styles => { 
  #   :thumb => ["100x100"], 
  #   :medium => ["200x300>"],
  #   :large => ["600x400"] },
  #   :path          => ":rails_root/public/assets/:attachment/:id_partition/:basename-:style.:extension",
  #   :url           => "/assets/:attachment/:id_partition/:basename-:style.:extension",
  #   :default_url   => "/images/missing-:attachment-:style.png"
  
  
  class InvalidCsvFormat < StandardError; end
  
  def upload_csv=(file)
    return unless file.respond_to?(:read)
    data = CSV.parse(file.read, ";")
    raise InvalidCsvFormat if data.blank?
    header = data.shift
    
    raise InvalidCsvFormat unless header.first == "id_team"
    header.shift
    
    task_numbers = []
    
    while header.first =~ /task_\d+/
      task_numbers << header.shift[/task_(\d+)/, 1].to_i
    end
    
    raise InvalidCsvFormat unless header.first == "penalty"
    header.shift
    
    raise InvalidCsvFormat unless header.first == "result"
    header.shift
    
    raise InvalidCsvFormat unless header.first == "place"
    header.shift
    
    raise InvalidCsvFormat unless header.blank?

    data.each do |row|
      team = teams.find_by_number(team_number = row.shift.to_i)
      next unless team
      task_numbers.each do |number|
        tasks_for_number = tasks.find_all_by_number(number)
        task_ids = tasks_for_number.map(&:id)
        photo = team.photos.find_by_task_id(task_ids) || team.photos.build(:task_id => task_ids.first)
        photo.mark = row.shift.gsub(",",'.').to_f
        photo.save!
      end
      
      team.penalty = row.shift.gsub(",",'.').to_f
      team.result = row.shift.gsub(",",'.').to_f
      team.place = row.shift.to_i
      team.save
    end
  end
  
  def tasks_with_numbers
    @tasks_with_numbers ||= tasks.numbered.find(:all, :select => "MAX(id), number, max(title) as title", :group => "number")
  end
  def photos_count(event)
    n=0
    categories = event.photo_categories
    categories.each do |category|
      n+=category.event_photos.count
    end
    return n
  end
  
end
