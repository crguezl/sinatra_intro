require 'sinatra'

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

before do
  content_type :html
end

get '/' do
  <<"EOS"
  <h2>Methods of the request object</h2>
  <ol>
  #{request.methods.map { |m| %Q{<li><font color="red">#{h m}</font>} }.join("\n")}
  </ol>
EOS
end
