# -*- encoding : utf-8 -*-
class EventsController < ApplicationController
  require_admin :only => [:create, :update, :destroy]
  def index
    @notes = Note.recent.limit(10)
    @title = "СОБЫТИЯ"
    @events = Event.recent
    @events = @events.tagged_with(params[:tag]) if params[:tag]
    @events = @events.paginate(:page => params[:page], :per_page => 10)
    @tags = Event.tag_counts
                
  end
  
  def gallery
    @year = (params[:year] || Time.now.year).to_i
    @years = Event.years
    @events = Event.recent.year(@year).paginate(:page => params[:page], :per_page => 9)
    @title= "ГАЛЕРЕЯ"
                
  end
  
  def show
    if params[:name]
      @event = Event.find_by_name(params[:name]) 
    else
      @event = Event.find(params[:id].to_i)
    end
    
    # @event.photos.each do |photo|
    #   photo.image.recreate_versions! if photo.image?
    # end
    if @event.blank?
      render :text => "Страница не найдена", :status => 404, :layout => true

    else
      @event.image.recreate_versions! if @event.image?
      if params[:page]
        @page=params[:page].to_i
        if @page==0
          @page=1
        end
      end
      load_meta(@event)
      @description=@event.body      
      @team = current_user && current_user.teams.find_by_event_id(@event.id)
      @notes = @event.notes.recent.limit(10)
      @comments=@event.comments.paginate(:page => @page, :per_page => 10, :order=>"created_at DESC")

    end
  end
  
  def user_photos
    @event = Event.find(params[:id].to_i)
    @photo_category = @event.photo_categories.find_by_name(params[:category])
                
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to edit_admin_event_path(@event)
    else
      flash[:notice] = "произошла ошибка"
      redirect_to admin_events_path
    end
  end

  
  def update
    @event = Event.find(params[:id].to_i)
    if @event.update_attributes(params[:event])
      respond_to do |format|
        format.html { redirect_back_or_default edit_admin_event_path(@event) }
        format.json { render :json => @event }
      end
    else
      flash[:notice] = "произошла ошибка"
      redirect_to admin_events_path
    end
  end
  
  def destroy
    @event = Event.find(params[:id].to_i)
    @event.destroy
    redirect_to admin_events_path
  end
end
