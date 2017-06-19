class Chore < ApplicationRecord
  belongs_to :user
  belongs_to :category

  before_create :set_category_default

  private

  def set_category_default
    self.category ||= "uncategorized"
  end
end
