class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :sentence,    length: { in: 1..75 }

end
