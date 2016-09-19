require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require 'sass'

get('/style.css'){ scss :styles}

get '/' do
	@title = "Home"
	slim :home
end

get '/about' do
	@title = "All about this website"
	slim :about
end

get '/contact' do
	@title = "Contact us!"
	slim :contact
end

not_found do 
	slim :not_found
end