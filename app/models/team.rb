class Team < ApplicationRecord
    has_many :users
    has_many :chores, through: :users
    has_many :categories, through: :users

    include ActiveChores
end
