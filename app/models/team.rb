class Team < ApplicationRecord
    has_many :users
    has_many :chores, through: :users
end
