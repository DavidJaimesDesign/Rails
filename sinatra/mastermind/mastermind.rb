require 'sinatra'
require 'sinatra/reloader' if development?


get '/' do
	#"mastermind goes here"
	erb :index
end

=begin
	colors = ["black", "white", "red", "blue", "yellow", "green"]
blank_board = ["", "", "", ""]

def code_gen(board)
	colors = ["black", "white", "red", "blue", "yellow", "green"]
	board[0] = colors[rand(0..5)]
	board[1] = colors[rand(0..5)]
	board[2] = colors[rand(0..5)]
	board[3] = colors[rand(0..5)]
end

def guess_check(board,guess)
	@board = board
	@guess = guess
	red_pin_arr = Array.new
	no_pin_arr = guess - board

	board.each_with_index do |value, index|
		if board[index] == guess[index]
			red_pin_arr.push(value)
		end
	end

	white_pin_arr = guess - no_pin_arr - red_pin_arr
	
	puts "There are #{white_pin_arr.length} white pins"
	puts "There are #{red_pin_arr.length} red pins"

end

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