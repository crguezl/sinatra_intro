require 'sinatra'

before do
  content_type :txt
end

class Flujo
  def each
    100.times { |i| yield "#{i}\n"}
  end
end

get '/' do
  Flujo.new
end
