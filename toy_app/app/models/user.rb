class User < ApplicationRecord
	has_many :microposts
	validates :name, presence: true #replace fill in with right code
	validates :email, presence: true
end
