class Chore < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :category, required: false

  after_initialize :set_defaults

  validates :title, presence: true
  validates :frequency_interval, presence: false, unless: :frequency_amount?
  validates :frequency_amount, presence: false, unless: :frequency_interval?

  def category_attributes=(category_attributes)
    if !category_attributes.values.first.blank?
      category = Category.find_or_create_by(category_attributes)
      self.category=(category)
      self.save
    end
  end

  def self.overdue
    @overdue ||= self.where('duration_end_date < ?', DateTime.now)
  end

  def self.active_chores
    @active_chores ||= self.where("active IS ?", true)
  end

  private

  def set_defaults
    self.category ||= Category.find_or_create_by(title: 'Uncategorized')
    self.active = true
  end

end
