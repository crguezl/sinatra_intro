# The return value of a route block determines at least the response
# body passed on to the HTTP client, or at least the next middleware
# in the Rack stack. Most commonly, this is a string, 
# but other values are also accepted.
#

require 'sinatra'

before do
  content_type 'text/plain'
end
class Stream
  def each
    100.times do |i| 
      yield "#{i}\n" 
    end
  end
end

get('/') do 
  Stream.new 
end
