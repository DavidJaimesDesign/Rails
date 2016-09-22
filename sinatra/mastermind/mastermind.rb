require 'sinatra'
require 'sinatra/reloader' if development?
set :port, 9494

class Mastermind
	attr_accessor :board, :guess_count, :white_pin, :red_pin

	def initialize
		@board           = Array.new(4, rand(6))
		@white_pin_arr   = Array.new
		@red_pin_arr 	 = Array.new
	end

	def guess_check(guess)
		@guess = guess
		no_pin_arr = guess - board

		board.each_with_index do |value, index|
			if board[index] == guess[index]
				@red_pin_arr.push(value)
			end
		end

		@white_pin_arr = guess - no_pin_arr - @red_pin_arr
	end

	def display_white_pins
	end

	def display_red_pins
	end
end

configure do 
	enable :sessions
end

get '/' do
	#"mastermind goes here"
	if session[:game].nil?
		redirect to('/new')
	else
		if session[:guess_count] == 12
			redirect to('/lose')
		else
			guess_no = 12 - session[:guess_count]
			erb :index, :locals => {:guess_no => guess_no}
		end
	end
end

post '/' do
	session[:guess_count] += 1
	#session[:game].guess_check(guess)
	redirect to('/')
end

get '/new' do
	session[:game]        = Mastermind.new
	session[:guess_count] = 0
	redirect to('/')
end

get '/?code=9999' do
	redirect to('/guess')
end

get '/guess' do
	erb :guess, :locals => {:guess_no => guess_no}
end

get '/win' do
	erb :win
end

get '/lose' do
	erb :lose
end 
