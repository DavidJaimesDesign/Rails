class UsersController < ApplicationController

	def index
		@name = "I am an index function"
	end

	def new
		@new = "need to research this"
	end

	def posts
		@posts = "I am a post"
	end

	def update
		@update = "I am an update"
	end

	def delete
		@delete = "I am a delete"
	end
end
