class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
end
