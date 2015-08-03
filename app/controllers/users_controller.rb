# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
skip_before_filter :require_login, :only => [:index, :new, :create]  
 # auto_complete_for :user, :user_login
  
  def index
      @users = User.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @users }
      end
    end

  
  def new
    @user = User.new(params[:user])
                    
  end
  def edit
      @user = User.find(params[:id])
  end
    
  def create
      @user = User.new(params[:user])

      respond_to do |format|
        if @user.save
          format.html { redirect_to(:users, :notice => 'Registration successfull. ') }
          format.xml { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  
  before_filter :verify_user, :only => [:update]
  def update
    (params[:user] || {}).merge!(:is_admin => false) unless current_user && current_user.is_admin?
    if @user.update_attributes(params[:user])
      redirect_back_or_default root_path
    else
      render :action => "show"
    end
  end
  
  def show
    @user = User.find(params[:id])
                
  end
  
  def search
    
  end 
  
  def search_result 
    user_to_find=params[:user] 
    user1=user_to_find[:user_login] 
    @user=User.find(:first, :conditions => [“user_login = ?", user1]) 
    @events=@user.events
  end  
  
  protected
  def verify_user
    @user = User.find(params[:id])
    if current_user && (current_user.is_admin? || current_user == @user)
      return true
    end
    
    render :action => "sessions/new", :status => 403
  end
end
