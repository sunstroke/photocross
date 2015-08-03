# -*- encoding : utf-8 -*-
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
include ActsAsTaggableOn::TagsHelper
  def note_link(note)
    if note.in_new
      return link_to(raw(note.title), note.url,{:target => "_blank" }) unless note.url.blank?
      return link_to(raw(note.title), note.event, {:target => "_blank" }) if note.event
    else
      return link_to(raw(note.title), note.url) unless note.url.blank?
      return link_to(raw(note.title), note.event) if note.event      
    end
    raw(note.title)
  end
end
