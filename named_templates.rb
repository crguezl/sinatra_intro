require 'sinatra'
require 'haml'

#Templates may also be defined using the top-level template method:

template :layout do
  "%html\n  =yield\n"
end

template :index do
  <<'EOS'
%div.title 
  %h1 Hello World!
EOS
end

get '/' do
  haml :index
end

