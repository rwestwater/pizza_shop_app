require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/pizza_order.rb')

# CREATE orders
get '/pizza_orders/new' do
  erb(:new)
end

post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# READ orders
get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# UPDATE existing_orders


#DELETE orders
# get '/pizza_orders/:id' do
#   @order = PizzaOrder.delete()
#   erb(:index)
# end

post '/pizza_orders/:id' do
  @order = PizzaOrder.new()
  @order.delete()
  erb(:show)
end

# REDIRECT Orders
get "/pizza_orders" do
  redirect '/B'
end

get "/B" do
  redirect request.referer
end
