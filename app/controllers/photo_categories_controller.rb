# -*- encoding : utf-8 -*-
class PhotoCategoriesController < ApplicationController
  require_admin
  def show
    @photo_category = PhotoCategory.find(params[:id])
    render :json => @photo_category
  end    
  
  def create
    @photo_category = PhotoCategory.create(params[:photo_category])
    redirect_to :back
  end
  
  def update
    @photo_category = PhotoCategory.find(params[:id])
    @photo_category.update_attributes(params[:photo_category])
    respond_to do |format|
      format.html {redirect_to :back}
      format.json {render :json => @photo_category}
    end
  end

  def destroy
    @photo_category = PhotoCategory.find(params[:id])
    @photo_category.destroy
    redirect_to :back
  end
end
