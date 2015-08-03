# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Photocross::Application
# Photocross::Application.config.middleware.use ExceptionNotifier,
#   :email_prefix => "[Fcross] ",
#   :sender_address => %{"Application Error" <team@fcross.ru>},
#   :exception_recipients => %w{k.sunstroke@gmail.com}