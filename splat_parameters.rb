require 'sinatra'

get '/say/*/to/*' do |verb, name|
  # matches /say/hello/to/world
  "say #{verb} to #{name}<p>and<p>say #{params[:splat][0]} to #{params[:splat][1]}" # params[:splat]  => ["hello", "world"]
end
