require 'sinatra'

get '/say/*/to/*' do |verb, name|
  # matches /say/hello/to/world
  "say #{verb} to #{name} and say #{params[:splat][0]} to #{params[:splat][1]}" # params[:splat]  => ["hello", "world"]
end
