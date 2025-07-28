class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 20 }
  validates :content, presence: true, length: { minimum: 10 , maximum: 100 }
  

  # Additional methods or scopes can be added here

end