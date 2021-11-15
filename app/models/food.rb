class Food < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # food.liked_users で food を「いいね!」しているユーザーの一覧を取得できるようになる
  has_many :liked_users, through: :likes, source: :user
  validates :name, presence: true
  # food を user が「いいね！」しているときは「true」，「いいね」していないときは「false」
  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
  mount_uploader :image, ImageUploader
end
