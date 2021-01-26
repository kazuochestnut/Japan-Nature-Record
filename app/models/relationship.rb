class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'

  validates :user_id, presence: true
  validates :follow_id, presence: true
  
  private
  def set_user
    @user = User.find(params[:follow_id])
  end
end
