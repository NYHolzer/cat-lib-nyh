class Book < ActiveRecord::Base 
    belongs_to :user
    belongs_to :location
    
    def self.search(search)
        where('title like :pat or description like :pat', :pat => "%#{search}%")
    end
end