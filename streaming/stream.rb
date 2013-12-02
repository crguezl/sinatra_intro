require 'sinatra'

before do
  content_type :txt
end

class Flujo
  def each
    5.times do |i| 
      yield "#{i}: #{Time.now}\n"
      sleep 1
    end
  end

  def call(env)
    status, headers, body = @app.call(env)
    body = body.each.map { |s| s.upcase }
    [status, headers, body]
  end

end

get '/' do
  puts env
  Flujo.new
end
