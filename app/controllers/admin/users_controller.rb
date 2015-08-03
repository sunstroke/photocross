# -*- encoding : utf-8 -*-
class Admin::UsersController < ApplicationController
  before_filter :require_login    
  require_admin
  layout "admin"
  
  def index
    @users = User
    @users = @users.lookup(params[:query]) if params[:query]
    @users = @users.paginate(:per_page => 50, :page => params[:page])
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_back_or_default admin_users_path
  end

end
