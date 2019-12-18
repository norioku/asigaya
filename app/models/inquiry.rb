class Inquiry < ApplicationRecord
    
    enum status:[:未返信, :返信済]
end
