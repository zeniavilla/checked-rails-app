class Category < ApplicationRecord
    has_many :chores
    has_many :users, through: :chores

    validates :title, presence: true

end
