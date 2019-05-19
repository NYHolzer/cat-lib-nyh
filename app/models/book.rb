class Book < ActiveRecord::Base 
    belongs_to :user

    def self.search(search)
        where('title like :pat or description like :pat', :pat => "%#{search}%")
    end
end