class Favolite < ApplicationRecord
    
    belongs_to :users, dependent: :destroy
    belongs_to :posts, dependent: :destroy
end
