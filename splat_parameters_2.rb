require 'sinatra'

get '/download/*.*' do |path, extension|
  # matches /download/path/to/file.xml
  "path = #{path}. extension = #{extension}" # params[:splat] => ["path/to/file", "xml"]
end
