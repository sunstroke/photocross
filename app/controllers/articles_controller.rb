# -*- encoding : utf-8 -*-
class ArticlesController < ApplicationController
  require_admin :only => [:create, :update]
  def index
    @articles = Article.all
  end
  def create
    @article = Article.new(params[:article])
    @article.author = current_user
    if @article.save
      redirect_to new_admin_article_path()
    else
      render :template => "admin/articles/new"
    end
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_back_or_default edit_admin_article_path(@article)
    else
      render :template => "admin/articles/new"
    end
  end
  
  def show
    @article = Article.find(params[:id])
    load_meta(@article)
        
  end
  def default
    if @article = Article.find_by_id(params[:art].to_i)
      load_meta(@article)
                  
      render :action => "show"
    else
      redirect_to "/"
    end  
    
  end
  def page
                
    if @article = Article.find_by_permalink(params[:page])
      load_meta(@article)
      render :action => "show"
    else
      redirect_to "/"
    end  
  end
end
