class Beer < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites

  validates :name, presence: true, uniqueness: true
  validates :variety, presence: true
end
