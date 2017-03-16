class AddCounterIncorrectToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :counter_incorrect, :integer, null: false, default: 0
  end
end
