require 'sinatra'
require 'sinatra/reloader' if development?

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

		white_pin_arr = guess - no_pin_arr - @red_pin_arr
		#return the white and red pin arrays
	end
end

configure do 
	enable :sessions
end

get '/' do
	#"mastermind goes here"
	session[:code] = Mastermind.new
	session[:guess_count] = 0 

	guess = params[:code]
	if guess != nil
		guess = guess.split("")
		guess.each{|int| int.to_i}
		session[:code].guess_check(guess)
		session[:guess_count] += 1
	end
	guess_no = 12 - session[:guess_count]

	redirect to('/lose') if guess_no == 0
	erb :index, :locals => {:guess_no => guess_no}
end

get '/new' do
	guess = params[:code]
	erb :new
end

get '/?code=:code' do
	guess = params[:code]
	if guess != nil
		guess = guess.split("")
		guess.each{|int| int.to_i}
		session[:code].guess_check(guess)
		session[:guess_count] += 1
	end
	guess_no = 12 - session[:guess_count]
	erb :guess, :locals => {:guess_no => guess_no}
end

get '/win' do
	erb :win
end

get '/lose' do
	erb :lose
end 

=begin

count = 0
board = Array.new(4)
code_gen(board)
test_rig = ["blue", "blue", "green", "black"]

while count < 12 do
	puts "Color for the 1st spot"
	blank_board[0] = gets.chomp
	puts "Color for the 2nd spot"
	blank_board[1] = gets.chomp
	puts "Color for the 3rd spot"
	blank_board[2] = gets.chomp
	puts "Color for the 4th spot"
	blank_board[3] = gets.chomp
	puts "C1 = #{blank_board[0]} C2 = #{blank_board[1]} C3 = #{blank_board[2]} C4 = #{blank_board[3]}"

	guess_check(board, blank_board)
	if board == blank_board 
		"Game Over You have defeated the best neural net in the world"
		break
	end

	count += 1
end
=end