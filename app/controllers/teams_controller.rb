# -*- encoding : utf-8 -*-
class TeamsController < ApplicationController
  require_captain :only => [:update]
    before_filter :require_login ,:only => [:new]

  def index
    @event = Event.find(params[:event_id])
    load_meta(@event)
    @teams = @event.teams
                
  end
  
  def new
    @event = Event.find(params[:event_id])
    @team = @event.teams.build(params[:team])
                  
  end
  
  def create
    @team = Team.new(params[:team])
    @team.captain = current_user
    @event = @team.event
    if @team.save
      flash[:notice] = "Ура, я буду участвовать!"
      redirect_to @event
    else
      render :action => "new"
    end
  end
  
  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to @team
    else
      @event = @team.event
      @photo = Photo.new(:event => @event, :team => @team)
      render :action => "show"
    end
  end
 
  def profile
    @team = Team.find(params[:id])
    @event = @team.event
    load_meta(@event)
    @photo = Photo.new(:event => @event, :team => @team)
    @team_user = TeamUser.new(:team => @team)
                
  end 
  
  def show
    @team = Team.find(params[:id])
    @current_team = current_user && current_user.teams.find_by_event_id(@event.id)
    @event = @team.event
    load_meta(@event)
    @photo = Photo.new(:event => @event, :team => @team)
    @team_user = TeamUser.new(:team => @team)
                
  end
end
