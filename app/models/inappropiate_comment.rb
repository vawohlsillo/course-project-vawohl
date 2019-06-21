class InappropiateComment < ApplicationRecord
	has_many :comments
	validates :justification, length: { maximum: 60 , too_long: "60 characters is the maximum allowed" }
end
