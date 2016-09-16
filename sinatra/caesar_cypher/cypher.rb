require 'sinatra'
require 'sinatra/reloader' if development?


get '/' do
	string = params["string"]
	shift  = params["shift"]

	"cypher goes here"
	erb :index, :locals => {:enc_string => enc_string}
end

def cypher(t,s)
	@t = t
	@s = s.to_i
	ascii = t.chars.map {|c| c.ord}
	shifted = ascii.map  do |c| if c == 32
									c
								else
									c + @s
								end
						end
	return shifted.map {|c| c.chr}.join
end


