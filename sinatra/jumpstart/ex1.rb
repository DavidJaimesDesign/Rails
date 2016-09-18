require 'sinatra'
require 'sinatra/reloader' if development?

get '/:name' do
	name = params[:name]
	"hello there #{name}!"
end

get '/what/time/in/hours/:number/hours' do
	number = params[:number].to_i
	time = Time.now + number * 3600
	"The time in #{number} hours will be #{time.strftime('%I:%M %p')}"
end