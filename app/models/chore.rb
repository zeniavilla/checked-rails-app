class Chore < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :category, required: false

  before_create :set_defaults

  validates :title, presence: true
  validates :frequency_interval, presence: false, unless: :frequency_amount?

  def category_attributes=(category_attributes)
    category = Category.find_or_create_by(category_attributes)
    self.category=(category)
    self.save
  end

  private

  def set_defaults
    self.category ||= Category.find_or_create_by(title: 'uncategorized')
    self.active = true
  end

end
