class InappropiatePost < ApplicationRecord
	belongs_to :post
	belongs_to :user
	validates :justification, length: { maximum: 60 , too_long: "60 characters is the maximum allowed" }
	validates :user_id, uniqueness: { scope: :post_id }

end
