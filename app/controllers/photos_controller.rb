# -*- encoding : utf-8 -*-
class PhotosController < ApplicationController
  # session :cookie_only => false, :only => [:create]
  skip_before_filter :verify_authenticity_token, :only => [:create,:upload, :destroy]     
  
  # GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.all
            
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])
    @photo.image.recreate_versions! if @photo.image?              
    @event = @photo.event
    @task = @photo.task
            
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @event = Event.find(params[:event_id])
    @photo = Photo.new(:event => @event)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.new(params[:photo])
    @event = @photo.event
    
    if !@photo.valid? && @photo.team_id && @photo.task_id
      photo = Photo.find_by_team_id_and_task_id(@photo.team_id, @photo.task_id)
      if photo && params[:photo] && params[:photo][:image]
        @photo = photo
        @photo.image = params[:photo][:image]
      end
    end
    
    js_key = "photo_block_#{@photo.team_id}_#{@photo.task && @photo.task.number}"

    respond_to do |format|
      if @photo.save
        flash[:notice] = 'Photo was successfully created.'
        format.html { 
          head :ok
          #redirect_to(@photo.team) 
          }
        format.js  { render :update do |page| 
          page.replace_html js_key, :partial => "admin/events/photo", :object => @photo
        end }
      else
        format.html { render :action => "new" }
        format.js { render :update do |page|
          page << "$(#{js_key.to_json}).html('Не получилось сохранить файл '+ #{@photo.image.original_filename.to_json}+': <br> '+#{@photo.errors.full_messages.join("<br>").to_json}).addClass('error');"
        end }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        flash[:notice] = 'Photo was successfully updated.'
        format.html { redirect_to(@photo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(:back) }
    end
  end
  def rotate
    
  end
end
