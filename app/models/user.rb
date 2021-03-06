class User < ApplicationRecord
  attr_accessor :password_confirmation
  
  belongs_to :team, required: false
  has_many :chores
  has_many :categories, through: :chores

  has_secure_password
  validates_confirmation_of :password, message: "Password needs to match confirmation."

  validates :email, presence: { message: "Please enter your email address." }
  validates :email, uniqueness: { message: "That email address is already registered."}
  validates :name, presence: { message: "Please enter your name." }
  
  include ActiveChores

  def team_attributes=(team_attributes)
    if !team_attributes.values.first.blank?
      team = Team.find_or_create_by(team_attributes)
      self.team=(team)
      self.save
    end
  end

  def self.find_or_create_by_omniauth(auth_hash)
    where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |user|
      user.email = auth_hash.info.email
      user.name = auth_hash.info.name
      user.password = SecureRandom.hex
      user.password_confirmation = user.password
    end
  end

end