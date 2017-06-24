class Team < ApplicationRecord
    has_many :users
    has_many :chores, through: :users
    has_many :categories, through: :users

    def my_active_chores
        self.chores.where("active IS ?", true)
    end
end
