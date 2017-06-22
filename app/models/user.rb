class User < ApplicationRecord
  attr_accessor :password_confirmation
  
  belongs_to :team, required: false
  has_many :chores
  has_many :categories, through: :chores

  has_secure_password
  validates_confirmation_of :password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def team_attributes=(team_attributes)
    if !team_attributes.values.first.blank?
      team = Team.find_or_create_by(team_attributes)
      self.team=(team)
      self.save
    end
  end

  def overdue_chores
    Chore.overdue.where('user_id IS ?', self.id)
  end

  def my_active_chores
    Chore.active_chores.where('user_id IS ?', self.id)
  end
end