class Chore < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :category, required: false

  after_initialize :set_defaults

  validates :title, presence: true
  validates :frequency_interval, presence: false, unless: :frequency_amount?

  def category_attributes=(category_attributes)
    if !category_attributes.values.first.blank?
      category = Category.find_or_create_by(category_attributes)
      self.category=(category)
      self.save
    end
  end

  def self.overdue
    where('duration_end_date < ?', DateTime.now)
  end

  private

  def set_defaults
    self.category ||= Category.find_or_create_by(title: 'uncategorized')
    self.active = true
  end

end
