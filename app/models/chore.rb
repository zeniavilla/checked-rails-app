class Chore < ApplicationRecord
  belongs_to :user
  belongs_to :category

  before_create :set_defaults

  private

  def set_defaults
    self.category ||= "uncategorized"
    self.active = true
  end
end
