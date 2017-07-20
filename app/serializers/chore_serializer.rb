class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :title, :active, :frequency_amount, :frequency_interval, :duration_end_date
  belongs_to :category
  belongs_to :user
end
