require 'sinatra'

get '/hello/:name' do |n|
  "Hello #{n}!"
end
