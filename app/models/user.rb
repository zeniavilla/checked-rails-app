class User < ApplicationRecord
  belongs_to :team, required: false
  has_many :chores
  has_many :categories, through: :chores

  def team_attributes=(team_attributes)
    team = Team.find_or_create_by(team_attributes)
    self.build_team(team_attributes)
    self.save
  end
end