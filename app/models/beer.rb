class Beer < ApplicationRecord
  # belongs_to :brewery

  validates :name, presence: true, uniqueness: {case_sensitive: true}
  validates :variety, presence: true
  validates :rating, numericality: {only_integer: true, less_than_or_equal_to: 5} 
  validates :comments
  # validates :brewery_id, presence: true
end
