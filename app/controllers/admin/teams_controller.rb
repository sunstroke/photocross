# -*- encoding : utf-8 -*-
class Admin::TeamsController < ApplicationController
  before_filter :require_login    
  require_admin
  layout "admin"
  def index
    @event = Event.find(params[:event_id])
    @teams = @event.teams
  end
  
  def edit
    @event = Event.find(params[:event_id])
    @team = @event.teams.find(params[:id])
    @team_user = TeamUser.new(:team => @team)
  end
  
  def new
    @event = Event.find(params[:event_id])
    @team = Team.new(:event => @event, :number => @event.teams.maximum('number').to_i+1)
  end
  
  def create
    @event = Event.find(params[:event_id])
    if Team.transaction do
      @captain = (params[:captain] && !params[:captain][:login].blank?) ? User.create(params[:captain]) : nil
      @team = Team.new(params[:team])
      @team.captain = @captain if @captain
      @captain ? (@team.save && !@captain.new_record?) : @team.save
    end
      flash[:notice] = "Команда #{@team.title} создана успешно"
      redirect_to new_admin_event_team_path(@event)
    else
      render :action => "new"
    end
  end
  
  def update
    @event = Event.find(params[:event_id])
    @team = @event.teams.find(params[:id])
    
    if @team.update_attributes(params[:team])
      redirect_to edit_admin_event_team_path(@event, @team)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    @team = @event.teams.find(params[:id])
    
    @team.destroy
    redirect_to admin_event_teams_path(@event)
  end
end
