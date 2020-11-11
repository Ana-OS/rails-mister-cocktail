class Review < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user
  validates :content, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0,less_than_or_equal_to: 5,  only_integer: true }
end
