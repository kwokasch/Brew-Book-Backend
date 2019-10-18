class Beer < ApplicationRecord
  # belongs_to :brewery

  validates :name, presence: true, uniqueness: true
  validates :variety, presence: true
  validates :rating, numericality: {only_integer: true, less_than_or_equal_to: 5} 
  # validates :comments, presence: true
  # validates :brewery_id, presence: true
end
