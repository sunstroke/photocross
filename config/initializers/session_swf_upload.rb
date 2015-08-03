# -*- encoding : utf-8 -*-
# http://blog.inquirylabs.com/2006/12/09/getting-the-_session_id-from-swfupload/
# The following code is a work-around for the Flash 8 bug that prevents our multiple file uploader
# from sending the _session_id.  Here, we hack the Session#initialize method and force the session_id
# to load from the query string via the request uri. (Tested on Lighttpd, Mongrel, Apache)
# class CGI::Session
#   alias original_initialize initialize
#   def initialize(request, option = {})
#     session_key = 'lam'
#     query_string = if (qs = request.env_table["QUERY_STRING"]) and qs != ""
#       qs
#     elsif (ru = request.env_table["REQUEST_URI"][0..-1]).include?("?")
#       ru[(ru.index("?") + 1)..-1]
#     end
#     if query_string and query_string.include?(session_key)
#       option['session_id'] = query_string.scan(/#{session_key}=(.*?)(&.*?)*$/).flatten.first
#     end
#     original_initialize(request, option)
#   end
# end

# class ActionController::Session::CookieStore
#   # Read the session data cookie.
#   # actionpack/lib/action_controller/session/cookie_store.rb
#   # Overwrite method so I can try to pass session data via POST params
#   def read_cookie
#     request = @session.cgi.send :env_table
# 
#     query_string = if (qs = request["QUERY_STRING"]) and qs != ""
#       qs
#     elsif (ru = request["REQUEST_URI"][0..-1]).include?("?")
#       ru[(ru.index("?") + 1)..-1]
#     end
# 
#     if query_string and query_string.include?('_photocross_session')
#       return URI.decode(query_string.scan(/_photocross_session=(.*?)(&.*?)*$/).flatten.first)
#     else
#       @session.cgi.cookies[@cookie_options['name']].first
#     end
#   end
# end
