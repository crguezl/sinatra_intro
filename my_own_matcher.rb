require 'sinatra'

class AllButPattern
    Match = Struct.new(:captures)

    def initialize(except)
      @except = except
      @captures = Match.new([])
    end

    def match(str)
      @captures unless @except === str
    end
end

get AllButPattern.new('/index') do
  "Hello World!"
end

get '/index' do
  "Good bye!"
end
