class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :inappropiate_comments
	validates :description, presence: true
	validates :description, length: { in: 1..1000, too_long: "1000 characters is the maximum allowed" }

end
