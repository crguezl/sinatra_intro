# encoding: utf-8
require 'sinatra'
#require 'sinatra/authorization'
require 'sinatra/authentication'
require 'sinatra/security'

set :authorization_realm, 'Protected zone'

helpers do
  def authorize(login, password)
    login == "admin" && password == "secret"
  end

  def authorization_realm
    "Move on"
  end

end

set(:auth) do |*roles|   # <- notice the splat here
  condition do
    unless logged_in? && roles.any? {|role| current_user.in_role? role }
      redirect "/login/", 303
    end
  end
end

get "/my/account/", :auth => [:user, :admin] do
  "Your Account Details"
end

get "/only/admin/", :auth => :admin do
  "Only admins are allowed here!"
end

get '/login/' do
  login_required
  "Welcome in protected zone"
end 
