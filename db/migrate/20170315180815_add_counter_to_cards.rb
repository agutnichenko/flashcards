class AddCounterToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :counter, :integer, null: false, default: 0
  end
end
