# -*- encoding : utf-8 -*-
module EventsHelper
  def event_date(event)
    return "" unless event
    if event.handled_at<event.finishing_at
      
     # s = event.handled_at ? "#{event.finishing_at ? "с ": ""}" + event.handled_at.to_s(:date) : ""
     #s += event.finishing_at ? " по " + event.finishing_at.to_s(:date) : ""
     #Russian::strftime(@note.created_at,"%d %B %Y")

       s = event.handled_at ? "#{event.handled_at ? " с ": ""}" + Russian::strftime(event.handled_at,"%d %B %Y") : ""
      # s += event.finishing_at ? " по " + Russian::strftime(event.finishing_at,"%d %B %Y") : ""
    else
      
     # s = event.handled_at ? "#{event.finishing_at ? "с ": ""}" + event.handled_at.to_s(:date) : ""
     #s += event.finishing_at ? " по " + event.finishing_at.to_s(:date) : ""
     #Russian::strftime(@note.created_at,"%d %B %Y")
     s = event.handled_at ? " #{event.finishing_at ? " " : " "}" + Russian::strftime(event.handled_at,"%d %B %Y") : ""
    end
  end
end
