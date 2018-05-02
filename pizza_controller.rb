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
get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza_orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  erb(:update)
end

#DELETE orders
post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect to ('/pizza_orders')
end
