class Airline < ApplicationRecord
    has_many :reviews
 # before create callback 
 
 #sets the slug for our airline, before it's created in the db 
    
    before_create :slugify 
 
    def slugify #slugify it? 
    #creates a URL safe version of the airline name 
    self.slug = name.parameterize 
    end
 
    #gets average score for reviews of the airline 
    
    def avg_score 
    #takes the avg score and rounds it 
    reviews.average(:score).round(2).to_f 
    end
end
