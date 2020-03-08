class ChatThread < ApplicationRecord
  belongs_to :game_tittle
  has_many :responses

  validates :sentence,    length: { in:   1..75 }


  def self.search(search_word)
    @contents = ChatThread.where("name LIKE(?)","%#{search_word}%")
  end

end
