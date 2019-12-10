class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name,           presence: true
  validates :email,          presence: true
  validates :profile,        length: { maximum: 200 }

  has_many :favorites, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  attachment :image
end
