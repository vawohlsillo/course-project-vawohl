class Post < ApplicationRecord
	belongs_to :user
	belongs_to :inappropiate_post
	has_one :blacklist
	has_one :dumpster
	has_many :comments
	has_many_attached :files
	validates :title, :description, :user_id, presence: true	
	validates :title, length: { in: 1..100, too_long: "100 characters is the maximum allowed" }
	validates :description, length: { in: 1..1250, too_long: "1250 characters is the maximum allowed" } 
end
