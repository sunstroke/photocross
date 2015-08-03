class BannerImg < ActiveRecord::Base
  attr_accessible :banner_id, :img, :left, :pos, :sp, :top, :z
  mount_uploader :img, AttachUploader
  belongs_to :banner
end
