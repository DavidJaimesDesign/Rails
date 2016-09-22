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
		guess.split('')
		guess.each{|int| int.to_i}
				
		no_pin_arr = guess - board

		board.each_with_index do |value, index|
			if board[index] == guess[index]
				@red_pin_arr.push(value)
			end
		end

		@white_pin_arr = guess - no_pin_arr - @red_pin_arr
	end

	def display_white_pins
		return "You have #{@white_pin_arr.length} correct digits in the correct location"
	end

	def display_red_pins
		return "You have #{@red_pin_arr.length} correct digits but not in the correct location"	
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
			white_pins = session[:game].display_white_pins
			red_pins   = session[:game].display_red_pins
			guess_no   = 12 - session[:guess_count]
			erb :index, :locals => {:guess_no => guess_no, :white_pins => white_pins, :red_pins => red_pins}
		end
	end
end

post '/' do
	session[:guess_count] += 1
	session[:game].guess_check(:code)
	redirect to('/')
end

get '/new' do
	session[:game]        = Mastermind.new
	session[:guess_count] = 0
	redirect to('/')
end

get '/win' do
	erb :win
end

get '/lose' do
	erb :lose
end 
