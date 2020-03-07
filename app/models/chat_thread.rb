class ChatThread < ApplicationRecord
  belongs_to :game_tittle
  has_many :responses


  def self.search(search_word)
    @contents = ChatThread.where("name LIKE(?)","%#{search_word}%")
  end

end
