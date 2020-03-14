class ChatThread < ApplicationRecord
  has_many :responses
  has_many :favorite_threads
  

  def self.search(search_word)
    @contents = ChatThread.where("name LIKE(?)","%#{search_word}%").order(updated_at: :desc)
  end

  def favorited_by?(user)
    favorite_threads.where(user_id: user.id).exists?
  end

end
