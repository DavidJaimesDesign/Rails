require 'sinatra'
require 'sinatra/reloader' if development?
set :port, 9494

class Mastermind
	attr_accessor :board, :guess_count, :white_pin_arr, :red_pin_arr, :guess

	def initialize
		@board           = [1,2,3,4]
		@white_pin_arr   = Array.new
		@red_pin_arr 	 = Array.new
	end

	def guess_check(guess)
		@guess = guess
		guess = guess.split('')
		guess_arr = guess.map!{|v| v.to_i}
		
		puts guess_arr.inspect	
		no_pin_arr = guess - board

		board.each_with_index do |value, index|
			if board[index] == guess[index]
				@red_pin_arr.push(value)
			end
		end

		@white_pin_arr = guess - no_pin_arr - @red_pin_arr
	end

	def display_white_pins
		return "You have #{@white_pin_arr.length} correct digits but not in in the correct order"
	end

	def display_red_pins
		return "You have #{@red_pin_arr.length} correct digits in the correct order"	
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
	session[:game].guess_check(params[:code])
	puts session[:game].white_pin_arr.inspect
	puts session[:game].guess.inspect
	puts session[:game].board.inspect
	redirect to('/win') if session[:game].red_pin_arr.length == 4
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
