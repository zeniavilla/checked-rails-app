class CreateChores < ActiveRecord::Migration[5.1]
  def change
    create_table :chores do |t|
      t.string :title
      t.boolean :active
      t.integer :frequency_amount
      t.string :frequency_interval
      t.integer :duration_repetition
      t.datetime :duration_end_date
      t.belongs_to :user, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
