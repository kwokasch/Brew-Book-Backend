class User < ApplicationRecord
    has_secure_password
    has_many :favorites
    has_many :beers, through: :favorites

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 7}
end
