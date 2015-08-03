# -*- encoding : utf-8 -*-
require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'active_support/core_ext/date/conversions'
if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
Bundler.require(:default, Rails.env) if defined?(Bundler)
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end


module Photocross
  class Application < Rails::Application
    config.autoload_paths += [config.root.join('lib')]
    config.encoding = 'utf-8'
    config.filter_parameters << :password << :password_confirmation    
    config.assets.enabled = true
    config.assets.version = '1.0'    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # See Rails::Configuration for more options.
  
    # Skip frameworks you're not going to use. To use Rails without a database
    # you must remove the Active Record framework.
    # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  
    # Only load the plugins named here, in the order given. By default, all plugins 
    # in vendor/plugins are loaded in alphabetical order.
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  config.autoload_paths += %W( #{Rails.root.to_s}/app/middlewares )
  config.autoload_paths += %W( #{Rails.root.to_s}/app/models/ )  
    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{Rails.root}/extras )
  
    # Force all environments to use the same logger level
    # (by default production uses :info, the others :debug)
    config.log_level = :debug
  
    # Make Time.zone default to the specified zone, and make Active Record store time values
    # in the database in UTC, and return them converted to the specified local zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Comment line to use default local time.
    config.time_zone = 'Moscow'
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)  
    # The internationalization framework can be changed to have another default locale (standard is :en) or more load paths.
    # All files from config/locales/*.rb,yml are added automatically.
    # config.i18n.load_path << Dir[File.join(Rails.root, 'my', 'locales', '*.{rb,yml}')]
    # config.i18n.default_locale = :de
    I18n.default_locale = :ru
    config.encoding = "utf-8"
    # Your secret key for verifying cookie session data integrity.
    # If you change this key, all old sessions will become invalid!
    # Make sure the secret is at least 30 characters and all random, 
    # no regular words or you'll be exposed to dictionary attacks.
  #  config.action_controller.session = {
  #    :key => '_photocross_session',
  #    :secret      => '6dc33baf1e12a992bfa7bb3e8ed6361ec44bb61fa3751f689be882200641198827abc1d6fc34e608272989e9349dddcda8d8b12657367e87095dceeb5f4cc12e', 
  #    :session_http_only => false ,
  #    :base_domain => true   
  #  }


 # Configure sensitive parameters which will be filtered from the log file.
  config.filter_parameters += [:password]
  # Enable the asset pipeline
  config.assets.enabled = true
  # Version of your assets, change this if you want to expire all your assets
  config.assets.version = '1.0'
  
    #   config.action_mailer.default_charset = "utf-8"
    #   config.action_mailer.perform_deliveries = true
    #   config.action_mailer.delivery_method = :sendmail
    #   config.action_mailer.sendmail_settings = {:arguments => "/usr/sbin/sendmail -i -t -f team@photocross.ru -F Photocross.
    # ru"}
  end
end
