class Review < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user
  validates :content, presence: true
  validates :cocktail_id, uniqueness: { scope: :user_id }
end
