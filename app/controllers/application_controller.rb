# -*- encoding : utf-8 -*-
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :current_users_list  
  before_filter :force_utf8_params
  #include ExceptionNotifiable
  include MetaHelper
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '8891a33c12443483db860be78e035cfd'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  #filter_parameter_logging :password, :password_confirmation
#  helper_method :current_user_session, :current_user
  
  

  def force_utf8_params
    traverse = lambda do |object, block|
      if object.kind_of?(Hash)
        object.each_value { |o| traverse.call(o, block) }
      elsif object.kind_of?(Array)
        object.each { |o| traverse.call(o, block) }
      else
        block.call(object)
      end
      object
    end
    force_encoding = lambda do |o|
      o.force_encoding(Encoding::UTF_8) if o.respond_to?(:force_encoding)
    end
    traverse.call(params, force_encoding)
  end
  ActionView::Base.default_form_builder = PhotocrossFormBuilder
  protected
  
  def current_users_list
      current_users.map {|u| u.login}.join(", ")
    end
  
  def not_authenticated
    redirect_to login_path, :alert => "Для просмотра необходимо войти."
  end
  private

  
  def require_admin
    unless current_user && current_user.is_admin?
      store_location
      flash[:notice] = "You must be admin to access this page"
      render :template => "sessions/new", :status => 403
      return false
    end
    true
  end
  
  def self.require_admin(*args)
    before_filter :require_admin, *args
  end
  
  def require_captain
    @team = Team.find(params[:id])
    unless current_user && (current_user.id == @team.captain_id || current_user.is_admin?)
      store_location 
      flash[:notice] = "You must be admin or team captain to access this page"
      render :template => "sessions/new", :status => 403
      return false
    end
  end

  def self.require_captain(*args)
    before_filter :require_captain, *args
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end

  def store_back_location
    session[:return_to] = request.url
    session[:return_to_back] = request.url    
  end


  def store_location
    session[:return_to] = request.url
  end
  
  before_filter :clean_stored_location
  
  def clean_stored_location
    session[:return_to] = nil if session[:return_to] && request.get?
  end

  def redirect_back_or_default(default)
    if params[:return_to]
      redirect_to params[:return_to]
    elsif session[:return_to]
      redirect_to session[:return_to]
      session[:return_to] = nil    
    elsif request.env["HTTP_REFERER"]
      redirect_to :back
    elsif default
      redirect_to default
    else
      redirect_to "/"
    end

  end
  
  def rotate(photo,direction)
      degrees = if direction == 'left' then -90 else 90 end
      
      #main photo
      image   = Magick::ImageList.new(photo.file)
      image   = image.rotate(degrees)
      image.write(photo.file)

      # thumb
      thumb   =  Rails.root + "/public/photo/file/#{photo.id}/square/#{File.basename(photo.file)}"
      image   = Magick::ImageList.new(thumb)
      image   = image.rotate(degrees)
      image.write(thumb)

      redirect_to :action => 'list'
  end
  
end
