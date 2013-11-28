# http://www.sinatrarb.com/contrib/streaming.html

require 'sinatra'
require 'sinatra/streaming'

class StupidMiddleware
  def initialize(app) 
    @app = app 
  end

  def call(env)
    status, headers, body = @app.call(env)
    # Blocks passed to #map! or #map will actually be applied when streaming takes place
    body.map! { |e| e.upcase }
    [status, headers, body]
  end
end

use StupidMiddleware

before do
  content_type :html
end

song = %q{
And now, the end is near 
And so I face the final curtain 
My friend, I'll say it clear 
I'll state my case, of which I'm certain 
I've lived a life that's full 
I traveled each and ev'ry highway 
And more, much more than this, I did it my way 

Regrets, I've had a few 
But then again, too few to mention 
I did what I had to do , I saw it through without exemption 
I planned each charted course, each careful step along the highway 
And more, much more than this, I did it my way 

Yes, there were times, I'm sure you knew 
When I bit off more than I could chew 
And through it all, when there was doubt 
I ate it up and spit it out 
I faced it all and I stood tall and did it my way 

I've loved, I've laughed and cried 
I've had my fill, my share of losing 
And now, as tears subside, I find it all so amusing 
To think I did all that 
And may I say, not in a shy way, 
"Oh, no, oh, no, not me, I did it my way" 

For what is a man, what has he got? 
If not himself, then he has naught 
The right to say the things he feels and not the words of one who kneels 
The record shows I took the blows and did it my way!
}.split(/\n/)

song.map! { |x| x.split(/\s+/) }

set :song, song
set :colors, ["red", "blue", "black", "green", "yellow", "blueviolet" ]

get '/' do
  color = 0
  stream do |out|
    out.puts '<pre>'
    settings.song.each do |line|
      line.each do |w|
        out.print %Q{<font color="#{settings.colors[color]}">#{w} </font>}
        color = (color+1) % settings.colors.size
        sleep 0.02
      end
      out.puts "\n"
      sleep 1
   end
   out.puts '</pre>'
   out.close
  end
end
