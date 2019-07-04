class InappropiateComment < ApplicationRecord
	belongs_to :comment
	belong_to :user
	validates :justification, length: { maximum: 60 , too_long: "60 characters is the maximum allowed" }
end
