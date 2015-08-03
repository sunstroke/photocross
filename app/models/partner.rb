# -*- encoding : utf-8 -*-
class Partner < ActiveRecord::Base
  has_many :partner_events
  has_many :events , :through => :partner_events
  mount_uploader :image, StartImageUploader, :mount_on => :image_file_name  
  # has_attached_file :image, :styles => { 
  #   :thumb => ["100x100>"], 
  #   :medium => ["200x300>"],
  #   :large => ["600x400>"] },
  #   :path          => ":rails_root/public/assets/:attachment/:id_partition/:basename-:style.:extension",
  #   :url           => "/assets/:attachment/:id_partition/:basename-:style.:extension",
  #   :default_url   => "/images/missing-:attachment-:style.png"
end
