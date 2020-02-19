class GameTittle < ApplicationRecord
  belongs_to :game_genle
  has_many :game_threads
end
