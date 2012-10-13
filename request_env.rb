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
  <ol>
  #{request.env.map { |k, v| %Q{<li>#{k} => <font color="red">#{h v}</font>} }.join("\n")}
  </ol>
EOS
end
