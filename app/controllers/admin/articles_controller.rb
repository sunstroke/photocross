# -*- encoding : utf-8 -*-
class Admin::ArticlesController < ApplicationController
  before_filter :require_login    
  require_admin
  layout "admin"

  def index
    @articles = Article.recent.paginate(:page => params[:page], :per_page => 20)
  end
  
  def new
    @article = Article.new

  end
  
  def edit
    @article = Article.find(params[:id])
    render :action => "new"
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
  end
end
