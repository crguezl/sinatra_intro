require 'sinatra'

get '/posts.?:format?' do |x|
   # matches "GET /posts" and any extension "GET /posts.json", "GET /posts.xml" etc.
  x.to_s == '' ? "Nothing #{x.class}" : x
end
