class ChatThread < ApplicationRecord
  belongs_to :game_tittle
  has_many :responses
  has_many :favorite_threads

  validates :sentence,    length: { in:   1..75 }


  def self.search(search_word)
    @contents = ChatThread.where("name LIKE(?)","%#{search_word}%")
  end

  def favorited_by?(user)
    favorite_threads.where(user_id: user.id).exists?
  end

end
