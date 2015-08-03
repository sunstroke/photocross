# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  
  def index
    @notes = Note.recent.limit(18)
    @pervaya = Article.tagged_with("первая").recent
    @articles = Article.tagged_with("главная").recent
    #@events = Event.awaiting.limit(5).all
    @events = Event.recent.limit(3).all
    @title = "ГЛАВНАЯ"
    @banners= Banner.limit(3)
    @feedback=Feedback.new
    logger.info("welcome lf #{@lf}")
  end
end
