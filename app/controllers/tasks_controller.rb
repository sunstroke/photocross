# -*- encoding : utf-8 -*-
class TasksController < ApplicationController
  require_admin :only => [:create, :update, :destroy]
  def show
    @event = Event.find(params[:event_id])
    load_meta(@event)
    @number = params[:id]
    @tasks = @event.tasks.find_all_by_number(@number)
    @photos = Photo.for_tasks(@tasks)
                    
  end
  
  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to(gallery_admin_event_path(@task.event))
    else
      @event = @task.event
      render :template => "admin/events/gallery"
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      respond_to do |format|
        format.html {redirect_to(admin_event_path(@task.event))}
        format.json {render :json => @task }
      end
    else
      @event = @task.event
      render :template => "admin/events/gallery"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    redirect_to(admin_event_path(@task.event))
  end
end
