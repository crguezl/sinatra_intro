require 'sinatra'

set(:even) do |*roles|   # <- notice the splat here
  condition do
    roles.all? { |x| x.to_i % 2 == 0 }
  end
end

get "/sum/", :even => [1, 2] do
  "1, 2, all even"
end

get "/sum/", :even => 4 do
  "4 is even"
end
