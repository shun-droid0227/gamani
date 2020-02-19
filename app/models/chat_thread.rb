class ChatThread < ApplicationRecord
  belongs_to :game_tittle
  has_many :responses
end
