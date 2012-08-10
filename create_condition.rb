require 'sinatra'

set(:probability) { |value| condition { rand <= value } }

get '/win_a_car', :probability => 0.5 do
    "You won!"
end

get '/win_a_car' do
    "Sorry, you lost."
end
