class Banner < ActiveRecord::Base
  attr_accessible :bg, :info, :pos, :position, :visible, :link
  has_many :banner_imgs
end
