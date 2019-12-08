class Post < ApplicationRecord
    
    belongs_to :tags, dependent: :destroy
    belongs_to :users, dependent: :destroy
    has_many :images, dependent: :destroy
end
