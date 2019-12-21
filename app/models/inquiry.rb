class Inquiry < ApplicationRecord
    
    validates :content, presence: true
    validates :reply, presence: true, on: :updat
    
    enum status:[:未返信, :返信済]
end
