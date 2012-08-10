require 'sinatra'

set(:even) do |*nums|   # <- notice the splat here
  condition do
    nums.all? { |x| x % 2 == 0 }
  end
end

get "/sum/?", :even => [1, 2] do
  "1, 2, all even"
end

get "/sum/?", :even => 4 do
  "4 is even"
end
