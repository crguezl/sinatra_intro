require 'sinatra'

get '/foo', :agent => /[cC]hrome(.*)/ do
  "You're using Chrome #{params[:agent]}"
end

get '/foo', :agent => /(.*)/ do
 "agent: #{params[:agent]}"
end
