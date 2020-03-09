class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


        validates :name,    length: { in: 1..75 }


        attachment :image, type: :image
        attachment :roll_image, type: :image

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :responses
  has_many :favorites

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  has_many :favorite_threads

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def self.search(search_word)
      @contents = User.where("name LIKE(?)","%#{search_word}%")
  end

  # def following_posts(user)
  #   get_users = user.followings.pluck(:id)
  #   get_users.push(user.id)
  #   return Post.where(user_id: get_users)
  # end

end
