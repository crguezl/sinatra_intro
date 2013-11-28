require 'sinatra'

before do
  content_type :txt
end

class Flujo
  def each
    100.times do |i| 
      yield "#{i}\n"
:qa
    end
  end

  def call(env)
    status, headers, body = @app.call(env)
    body = body.each.map { |s| s.upcase }
    [status, headers, body]
  end

end

get '/' do
  Flujo.new
end
