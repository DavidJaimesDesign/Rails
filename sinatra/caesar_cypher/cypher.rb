require 'sinatra'
if development?
	require 'sinatra/reloader'
end

get '/' do
	"cypher goes here"
end

=begin
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
	puts shifted.map {|c| c.chr}.join
end

cypher(text, shift)
=end
