# -*- encoding : utf-8 -*-
class PhotocrossFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, params = {})
    draw_label(params.delete(:label)) {super(method, params)}
  end
  
  def text_area(method, params = {})
    draw_label(params.delete(:label)) {super(method, params)}
  end
  
  def password_field(method, params = {})
    draw_label(params.delete(:label)) {super(method, params)}
  end
  
  def file_field(method, params = {})
    draw_label(params.delete(:label)) {super(method, params)}
  end
  
  def date_select(method, params = {})
    draw_label(params.delete(:label)) {super(method, params)}
  end
  
  def check_box(method, params = {})
    draw_label(params.delete(:label)) {super(method, params)}
  end
  
  def draw_label(label)
    return yield if label.blank?
    "<p>#{label}:<br/>#{yield}</p>"
  end
  
  def select(method, choices, params = {})
    draw_label(params.delete(:label)) {super(method, choices, params)}
  end
end
