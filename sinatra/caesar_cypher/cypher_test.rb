def cypher(t = " ",s = 0)
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
end

t = "potato"
s = 3

puts cypher(t, s)