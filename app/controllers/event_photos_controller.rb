# -*- encoding : utf-8 -*-
class EventPhotosController < ApplicationController
  #session :cookie_only => false, :only => [:create]
  #skip_before_filter :verify_authenticity_token, :only => :create
  skip_before_filter :verify_authenticity_token, :only => [:create,:upload, :destroy]    
  def create
    @event_photo = EventPhoto.new(params[:event_photo])

    #@event_photo.user = current_user_session.user
    respond_to do |format|
      if @event_photo.save
        format.html {
          head :ok
          #redirect_to :back
          }
        format.js { 
          render :update do |page| 
          @event = @event_photo.event
          page.replace_html "#photo-list .uploading:first", :partial => "events/photo", :object => @event_photo
          page << "$('#photo-list .uploading:first').removeClass('uploading');"
        end }
      else
        format.html {
          redirect_to :back
         }
      end
    end
  end
  
  require_admin :only => [:update, :destroy]
  def update
    @event_photo = EventPhoto.find(params[:id])
    @event_photo.update_attributes(params[:event_photo])
    redirect_to :back
  end

  def destroy
    @event_photo = EventPhoto.find(params[:id])
    @event_photo.destroy
    redirect_to :back
  end

  
end
