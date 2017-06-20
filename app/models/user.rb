class User < ApplicationRecord
  attr_accessor :password_confirmation
  
  belongs_to :team, required: false
  has_many :chores
  has_many :categories, through: :chores

  has_secure_password
  validates_confirmation_of :password

  def team_attributes=(team_attributes)
    team = Team.find_or_create_by(team_attributes)
    self.team=(team)
    self.save
  end
end