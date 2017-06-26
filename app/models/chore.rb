class Chore < ApplicationRecord
  belongs_to :user
  belongs_to :category, required: false

  after_initialize :set_defaults

  validates :title, presence: { message: "Please enter a chore name." }
  validates :frequency_interval, presence: { message: "Please select a repeat interval or delete the repeat amount." }, if: :frequency_amount?
  validates :frequency_amount, presence: { message: "Please enter a repeat amount or clear the repeat interval." }, if: :frequency_interval?

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
