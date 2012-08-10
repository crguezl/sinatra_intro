require 'sinatra'

get %r{/hello/([\w]+)} do |c|
  "Hello, #{c}! and Hello, #{params[:captures][0]}!"
end
