class Post < ApplicationRecord
  
  attachment :image
  belongs_to :user
  
  validates :name, :category_id, :location_id, :visit, :price, :description, presence: true
  validates :description, length: {maximum: 500}

  
  
end
