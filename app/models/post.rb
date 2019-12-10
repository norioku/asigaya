class Post < ApplicationRecord
    
    acts_as_taggable
    
    # belongs_to :tag, dependent: :destroy
    belongs_to :user
    has_many :favorites, dependent: :destroy
    
    attachment :image
end
