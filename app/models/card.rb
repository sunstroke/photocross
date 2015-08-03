# -*- encoding : utf-8 -*-
class Card < ActiveRecord::Base
  belongs_to :team
  if !:pin?
    validates_length_of :pin_one, :is => 5 , :message => "^Длинна кода должна быть ровно 5 символов"
    validates_length_of :pin_two, :is => 5 , :message => "^Длинна кода должна быть ровно 5 символов"
  end
  
  
end
