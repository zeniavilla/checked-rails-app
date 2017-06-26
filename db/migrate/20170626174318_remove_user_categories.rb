class RemoveUserCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_categories
  end
end
