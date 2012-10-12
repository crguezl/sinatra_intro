# When requesting "/" with Chrome for example, we get the XML.
# Here is the ACCEPT header sent by Chrome : 
# application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5 
# which according to RFC2616 means that the browser requests HTML, then plain text and then others."
require 'sinatra'

get '/', :provides => :xml do
  <<-XML
  <?xml version="1.0" encoding="UTF-8"?>
  <content>
    You requested XML !
  </content>
  XML
end

get '/', :provides => :html do
  <<-HTML
  <!DOCTYPE html>
  <html>
    <head><title>Test</title></head>
    <body><p>You requested HTML</p></body>
  </html>
  HTML
end
