class Category < ApplicationRecord
    has_many :chores
    has_many :user_categories
    has_many :users, through: :user_categories

    validates :title, presence: true

end
