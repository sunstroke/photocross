# -*- encoding : utf-8 -*-
class TeamUsersController < ApplicationController
  def create
    @team_user = TeamUser.new(params[:team_user])
    if @team_user.save
      redirect_back_or_default @team_user.team
    else
      @team = @team_user.team
      @event = @team.event
      render :template => "teams/show"
    end
  end
  
  def accept
    if @team_user = TeamUser.find_by_accept_key(params[:id])
      @team_user.accepted = true
      @team_user.accept_key = nil
      @team_user.save
      UserSession.create(@team_user.user, true)
      flash[:notice] = "Ваше участие в команде «#{@team_user.team.title}» подтверждено"
    else
      flash[:notice] = "Неправильный ключ подтверждения"
    end
    redirect_to root_path
  end

  def reject
    if @team_user = TeamUser.find_by_accept_key(params[:id])
      @team_user.accepted = false
      @team_user.accept_key = nil
      @team_user.save
      UserSession.create(@team_user.user, true)
      flash[:notice] = "Ваше участие в команде «#{@team_user.team.title}» отменено"
    else
      flash[:notice] = "Неправильный ключ отказа"
    end
    redirect_to root_path
  end
end
