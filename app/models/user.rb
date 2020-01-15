class User < ApplicationRecord

	devise	:database_authenticatable, :registerable,
					:recoverable, :rememberable, :validatable

	validates :name,		presence: true
	validates :profile,	length: { maximum: 50 }

	has_many :posts
	has_many :favorites, dependent: :destroy
	has_many :favorite_posts, through: :favorites, source: :post

	attachment :image
end


