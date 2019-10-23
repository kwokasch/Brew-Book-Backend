class Beer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :variety, presence: true
end
