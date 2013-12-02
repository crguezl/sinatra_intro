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
end

get '/' do
  puts env
  Flujo.new
end
