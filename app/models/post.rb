class Post < ApplicationRecord
    
    acts_as_taggable
    acts_as_ordered_taggable_on :tags
    
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favoriting_users, through: :favorites, source: :user
    
    attachment :image
    
    validates :title, presence: true
    validates :content, presence: true
    validates :image, presence: true
    validates :location, presence: true
    
end
