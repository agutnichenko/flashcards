class AddCountersToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :counter_incorrect, :integer, default: 0
    add_column :cards, :counter_correct, :integer, default: 0
  end
end
