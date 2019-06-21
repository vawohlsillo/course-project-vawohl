class User < ApplicationRecord
	has_many :posts
	has_many :comments
	has_one :blacklist
	validates :name, presence: true
end
