require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'


get '/' do
  erb :home
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end

get '/contacts' do
  erb :contacts
end

get '/admin' do
  erb :admin
end

post '/home' do
  @login = params[:login]
  @password = params[:password]

  if @login == 'admin' && @password == 'secret'
    erb :admin
  elsif @login == 'admin' && @password == 'admin'
    @denied = 'Ха-ха-ха, хорошая попытка. Доступ запрещён!'
    erb :home
  else
    @denied = 'Доступ запрещён!'
    erb :home
  end

end

post '/visit' do
  @username = params[:username]
  @phone = params[:phone]
  @datetime = params[:datetime]
  @hairdresser = params[:hairdresser]

  client = File.open './public/client.txt', 'a'
  client.write "Name: #{@username}, phone: #{@phone}, time: #{@datetime}\nHairdresser: #{@hairdresser}"
  client.close

  erb :visit
end

post '/contacts' do
  @mail = params[:mail]
  @textbox = params[:textbox]

  cont = File.open './public/contacts.txt', 'a'
  cont.write "Mailing address #{@mail}. \nMessage:\n#{@textbox}\n"
  cont.close

  erb :contacts
end



