require 'sinatra'

get %r{/hello/([\w]+)} do |c|
  "Hello, #{c}!"
end
