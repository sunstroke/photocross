# -*- encoding : utf-8 -*-
class PartnerEvent < ActiveRecord::Base
    belongs_to  :partner
    belongs_to  :event
end
