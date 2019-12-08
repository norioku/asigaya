class Image < ApplicationRecord
    
    belongs_to :posts, dependent: :destroy
end
