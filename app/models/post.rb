class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title, 


    def is_clickbait
        if title.present? && title.exclude?("Won't Believe" || "Secret" || "Top [number]" || "Guess") 
            errors.add(:title, "Need more clickbait, babe")
        end
    end 
end
