class Post < ApplicationRecord
	belongs_to :user
	has_many :inappropiate_posts, dependent: :delete_all
	has_one :blacklist
	has_one :dumpster
	has_many :comments, dependent: :delete_all
	has_many :flags, dependent: :delete_all
	has_many_attached :files
	has_many :likes, dependent: :delete_all
	validates :title, :description, :user_id, presence: true	
	validates :title, length: { in: 1..100, too_long: "100 characters is the maximum allowed" }
	validates :description, length: { in: 1..1250, too_long: "1250 characters is the maximum allowed" } 
end
