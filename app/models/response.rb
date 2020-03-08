class Response < ApplicationRecord
  belongs_to :user
  belongs_to :chat_thread

  validates :sentence,    length: { in: 1..75 }

end
