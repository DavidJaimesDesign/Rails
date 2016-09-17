require 'sinatra'
require 'sinatra/reloader' if development?


get '/' do
	string = params["string"]
	shift  = params["shift"]
	enc_string = cypher(string, shift)
	#cypher goes here
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
<div>Icons made by <a href="http://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
=end
