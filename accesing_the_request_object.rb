# app running on http://example.com/example
require 'sinatra'
get '/foo' do
   mimes = %w[text/css text/html application/javascript]

   puts "accept               = #{request.accept              }"# ['text/html', '*/*']
   puts "accept? 'text/xml'   = #{request.accept? 'text/xml'  }"# true
   puts "preferred_type(mimes)   = #{request.preferred_type(mimes)}"# 'text/html'
   puts "body                 = #{request.body                }"# request body sent by the client (see below)
   puts "scheme               = #{request.scheme              }"# "http"
   puts "script_name          = #{request.script_name         }"# "/example"
   puts "path_info            = #{request.path_info           }"# "/foo"
   puts "port                 = #{request.port                }"# 80
   puts "request_method       = #{request.request_method      }"# "GET"
   puts "query_string         = #{request.query_string        }"# ""
   puts "content_length       = #{request.content_length      }"# length of request.body
   puts "media_type           = #{request.media_type          }"# media type of request.body
   puts "host                 = #{request.host                }"# "example.com"
   puts "get?                 = #{request.get?                }"# true (similar methods for other verbs)
   puts "form_data?           = #{request.form_data?          }"# false
   puts "['SOME_HEADER']      = #{request['SOME_HEADER']      }"# value of SOME_HEADER header
   puts "referrer             = #{request.referrer            }"# the referrer of the client or '/'
   puts "user_agent           = #{request.user_agent          }"# user agent (used by :agent condition)
   puts "cookies              = #{request.cookies             }"# hash of browser cookies
   puts "xhr?                 = #{request.xhr?                }"# is this an ajax request?
   puts "url                  = #{request.url                 }"# "http://example.com/example/foo"
   puts "path                 = #{request.path                }"# "/example/foo"
   puts "ip                   = #{request.ip                  }"# client IP address
   puts "secure?              = #{request.secure?             }"# false (would be true over ssl)
   puts "forwarded?           = #{request.forwarded?          }"# true (if running behind a reverse proxy)
   puts "env                  = #{request.env                 }"# raw env hash handed in by Rack

  request.accept              # ['text/html', '*/*']
  request.accept? 'text/xml'  # true
  request.preferred_type(mimes) # 'text/html'
  request.body                # request body sent by the client (see below)
  request.scheme              # "http"
  request.script_name         # "/example"
  request.path_info           # "/foo"
  request.port                # 80
  request.request_method      # "GET"
  request.query_string        # ""
  request.content_length      # length of request.body
  request.media_type          # media type of request.body
  request.host                # "example.com"
  request.get?                # true (similar methods for other verbs)
  request.form_data?          # false
  request["SOME_HEADER"]      # value of SOME_HEADER header
  request.referrer            # the referrer of the client or '/'
  request.user_agent          # user agent (used by :agent condition)
  request.cookies             # hash of browser cookies
  request.xhr?                # is this an ajax request?
  request.url                 # "http://example.com/example/foo"
  request.path                # "/example/foo"
  request.ip                  # client IP address
  request.secure?             # false (would be true over ssl)
  request.forwarded?          # true (if running behind a reverse proxy)
  request.env                 # raw env hash handed in by Rack


end
