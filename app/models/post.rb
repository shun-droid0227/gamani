class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search_word)
    @contents = Post.where("sentence LIKE(?)","%#{search_word}%")
  end

end
