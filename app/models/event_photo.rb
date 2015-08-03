# -*- encoding : utf-8 -*-
require 'mime/types'
class EventPhoto < ActiveRecord::Base
  belongs_to :event
  belongs_to :photo_category
  belongs_to :user
  
  validates_presence_of :event_id, :message => "can't be blank"
  validates_presence_of :user_id, :message => "can't be blank"
  validates_presence_of :photo_category_id, :message => "can't be blank"
  before_validation :set_event
  def set_event
    self.event = photo_category && photo_category.event
  end  
  mount_uploader :image, EventPhotoUploader, :mount_on => :image_file_name  
  # has_attached_file :image, :styles => { 
  #   :thumb => ["100x100#"], 
  #   :medium => ["200x300"],
  #   :large => ["600x400"] },
  #   :path          => ":rails_root/public/assets/:attachment/:id_partition/:basename-:style.:extension",
  #   :url           => "/assets/:attachment/:id_partition/:basename-:style.:extension",
  #   :default_url   => "/images/missing-:attachment-:style.png"
  
    def swf_uploaded_data=(data)
    data.content_type = MIME::Types.type_for(data.original_filename)
    self.image = data
    end
end
