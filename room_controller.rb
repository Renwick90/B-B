require('sinatra')
require('sinatra/contrib/all') 
require('pry-byebug')
require_relative('./models/room')

get '/room/new' do
  erb(:new)
end

post '/room' do
  @room = Room.new(params)
  @room.save()
  erb(:create)
end

get '/room' do
  @rooms = Room.all()
  erb (:index)
end

