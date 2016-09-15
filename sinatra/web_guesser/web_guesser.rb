require 'sinatra'
require 'sinatra/reloader'
rand_no = rand(100)

get '/' do
	erb :index, :locals => {:rand_no => rand_no}
end