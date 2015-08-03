# -*- encoding : utf-8 -*-
class AdminController < ApplicationController
  require_admin
  before_filter :require_login    
end
