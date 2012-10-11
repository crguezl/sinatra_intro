require 'sinatra'

get '/say/*/to/*/and/:tutu' do |verb, name, tutu|
  # matches /say/hello/to/world
  "say #{verb} to #{name}<p>and<p>tutu = #{tutu}" 
end

