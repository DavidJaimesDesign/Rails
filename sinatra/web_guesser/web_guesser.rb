require 'sinatra'
require 'sinatra/reloader'
rand_no = rand(100)

get '/' do
	"The secret number is hell #{rand_no}"
end