# For sending files, you can use the send_file helper method:
require 'sinatra'

get '/' do
  #send_file 'foo.jpg', :type => :jpg
  send_file 'peli.mov', :type => :mov
end
