# -*- encoding : utf-8 -*-
class ViewerController < ApplicationController
  def show
    @event = Event.find_by_name(params[:name])  
    load_meta(@event)
    @team = current_user && current_user.teams.find_by_event_id(@event.id)
    @notes = @event.notes.recent.limit(10)
    @comments=@event.comments.paginate(:page => params[:page], :per_page => 10)
       
    render :action => "show", :controller=>"events"         
  end

end
