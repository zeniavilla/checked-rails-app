class AddDefaultValueToChore < ActiveRecord::Migration[5.1]
  def change
    change_column :chores, :active, :boolean, default: true
  end
end
