# -*- encoding : utf-8 -*-
class Pressrelise < ActiveRecord::Base
  belongs_to :event
  mount_uploader :image, StartImageUploader, :mount_on => :image_file_name  
  # has_attached_file :relise, :styles => { 
  #   :thumb => ["100x100>", :pdf], 
  #   :medium => ["200x200>", :pdf],
  #   :path          => ":rails_root/public/assets/:attachment/:id_partition/:basename-:style.:extension",
  #   :url           => "/assets/:attachment/:id_partition/:basename-:style.:extension",
  #   :default_url   => "/images/missing-:attachment-:style.png"
  #   }
end
