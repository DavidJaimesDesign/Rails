require 'sinatra'
if development?
	require 'sinatra/reloader'
end
SECRET_NO = rand(100)

get '/' do
	guess = params['guess']
	message = check_guess(guess)
	erb :index, :locals => {:message => message}
end

def check_guess(guess)
	if guess.to_i < SECRET_NO
		"TO LOW BRO"
	elsif  guess.to_i > SECRET_NO
		"TO DAMN HIGH"
	elsif guess.to_i == SECRET_NO
		"CORRECT YOU MAY LIVE ANOTHER DAY the number was #{SECRET_NO}"
	end
end