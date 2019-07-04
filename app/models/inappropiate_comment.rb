class InappropiateComment < ApplicationRecord
	belongs_to :comment
	belongs_to :user
	validates :justification, length: { maximum: 60 , too_long: "60 characters is the maximum allowed" }
	validates :user_id, uniqueness: { scope: :comment_id }
end
