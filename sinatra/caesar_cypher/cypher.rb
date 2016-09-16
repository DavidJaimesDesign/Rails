require 'sinatra'
require 'sinatra/reloader' if development?


get '/' do
	string = params["string"]
	shift  = params["shift"]
	enc_string = cypher(string, shift)
	"cypher goes here"
	erb :index, :locals => {:enc_string => enc_string}
end

def cypher(t = "",s = 0)
	c_string = ""
	t = t.to_s
	s = s.to_i
	#return "Error max shift is 26" if s > 26 
	ascii = t.chars.map {|c| c.ord}
	shifted = ascii.map  do |c| if c == 32
									c
								else
									c + s
								end
						end
	c_string = shifted.map {|c| c.chr}.join
	return c_string.to_s
end

=begin
return "Error max shift is 26" if s > 26 
	@t = t.to_s
	@s = s.to_i
	ascii = t.chars.map {|c| c.ord}
	shifted = ascii.map  do |c| if c == 32
									c
								else
									c + @s
								end
						end
	return shifted.map {|c| c.chr}.join
=end
