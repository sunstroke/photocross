# -*- encoding : utf-8 -*-
class Admin::NotesController < ApplicationController
  before_filter :require_login    
  require_admin
  layout "admin"
  def index
    @notes = Note.recent.all
  end
end
