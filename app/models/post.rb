class Post < ApplicationRecord

  attachment :image
  belongs_to :user
  belongs_to :location
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :name, :category_id, :location_id, :visit, :description, presence: true
  validates :description, length: {maximum: 500}
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  def user
  #インスタンスメソッドないで、selfはインスタンス自身を表す
    return User.find_by(id: self.user_id)
  end

end
