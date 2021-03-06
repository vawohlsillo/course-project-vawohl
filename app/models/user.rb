class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
	has_many :posts, dependent: :delete_all
	has_many :comments, through: :posts, dependent: :delete_all
	has_many :inappropiate_posts, dependent: :delete_all
	has_many :inappropiate_comments, dependent: :delete_all
	has_one :blacklist
	has_many :likes, dependent: :delete_all
	has_many :flags, dependent: :delete_all
	validates :name, presence: true
	validates :city, presence: true
	validates :country, presence: true
	has_one_attached :image
	after_create :image_is_attached
	def image_is_attached
		if !self.image.attached?
			self.image.attach(io: File.open(Rails.root.join("app","assets","images","nophoto.png")), filename: 'nophoto.png', content_type: "image/png")
		end
	end

	
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.name = auth.info.email
			user.password = Devise.friendly_token[0,20]
		end
	end
end
