# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  before_filter :require_login ,:only => [:create]

  require_admin :only => [:update, :destroy]

  def create
    @comment = Comment.create((params[:comment] || {}).merge(:user_id => current_user.id))
    redirect_back_or_default(@comment.event)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    redirect_back_or_default(@comment.event)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back_or_default @comment.event
  end
end
