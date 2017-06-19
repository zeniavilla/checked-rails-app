class Category < ApplicationRecord
    has_many :chores
    has_many :users, through: :chores

    validates :title, presence: true
    validates :title, uniqueness: true
end
