require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = Math.sqrt(@the_num)
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @principal = params.fetch("principal").to_f
  @apr = params.fetch("apr").to_f
  @years = params.fetch("years").to_f

  monthly_rate = (@apr / 100) / 12
  months = @years * 12
  @monthly_payment = (@principal * monthly_rate) / (1 - (1 + monthly_rate)**-months)

  # Format values for display
  @formatted_principal = @principal.to_fs(:currency)
  @formatted_apr = "%.4f%%" % @apr
  @formatted_monthly_payment = @monthly_payment.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @random_number = rand(@min..@max)

  erb(:random_results)
end

get("/") do
  erb(:new_square_calc)
  # "<h1>Welcome to your Sinatra App!</h1>
  #  <p>Define some routes in app.rb</p>"
end
