# -*- encoding : utf-8 -*-
class Admin::EventsController < ApplicationController
  before_filter :require_login    
  require_admin
  layout "admin"
  
  def index
    @events = Event.all
    @event = Event.new
  end
  
  def edit
    @event = Event.find(params[:id].to_i)
    @param=params[:id].to_i
    @task = Task.new(:event => @event)
    @smi_event=@event.smi_events
  end
  
  def gallery
    @event = Event.find(params[:id].to_i)
    @photo = Photo.new(:event => @event)
    @task = Task.new(:event => @event)    
  end
  
  def destroy
    @event = Event.find(params[:id].to_i)
    @event.destroy
    redirect_to :back
  end
end
