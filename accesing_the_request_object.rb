# app running on http://example.com/example
require 'sinatra'
helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

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

   <<"EOS"
<ul>
  <li> request.accept = <font color="red">#{h(request.accept)}</font>             
  <li> request.accept? 'text/xml' = <font color="red">#{h(request.accept? 'text/xml')}</font> 
  <li> request.preferred_type(mimes) = <font color="red">#{h(request.preferred_type(mimes))}</font>
  <li> request.body = <font color="red">#{h(request.body)}</font>               
  <li> request.scheme = <font color="red">#{h(request.scheme)}</font>             
  <li> request.script_name = <font color="red">#{h(request.script_name)}</font>        
  <li> request.path_info = <font color="red">#{h(request.path_info)}</font>          
  <li> request.port = <font color="red">#{h(request.port)}</font>               
  <li> request.request_method = <font color="red">#{h(request.request_method)}</font>     
  <li> request.query_string = <font color="red">#{h(request.query_string)}</font>       
  <li> request.content_length = <font color="red">#{h(request.content_length)}</font>     
  <li> request.media_type = <font color="red">#{h(request.media_type)}</font>         
  <li> request.host = <font color="red">#{h(request.host)}</font>               
  <li> request.get? = <font color="red">#{h(request.get?)}</font>               
  <li> request.form_data? = <font color="red">#{h(request.form_data?)}</font>         
  <li> request["SOME_HEADER"] = <font color="red">#{h(request["SOME_HEADER"])}</font>     
  <li> request.referrer = <font color="red">#{h(request.referrer)}</font>           
  <li> request.user_agent = <font color="red">#{h(request.user_agent)}</font>         
  <li> request.cookies = <font color="red">#{h(request.cookies)}</font>            
  <li> request.xhr? = <font color="red">#{h(request.xhr?)}</font>               
  <li> request.url = <font color="red">#{h(request.url)}</font>                
  <li> request.path = <font color="red">#{h(request.path)}</font>               
  <li> request.ip = <font color="red">#{h(request.ip)}</font>                 
  <li> request.secure? = <font color="red">#{h(request.secure?)}</font>            
  <li> request.forwarded? = <font color="red">#{h(request.forwarded?)}</font>         
  <li> request.env = {<font color="red">#{ 
         out = "<ul>\n"
         request.env.each do |k,v|
           out << "<li> #{h k} => #{h v}\n"
         end
         out << "</ul>\n"
         out
       }
       </font>                
      }
</ul>
EOS

end
