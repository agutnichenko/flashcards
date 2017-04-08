class AddIntervalToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :interval, :integer, default: 1, null: false
    add_column :cards, :repeat, :integer, default: 1, null: false
    add_column :cards, :efactor, :float, default: 2.5, null: false
    add_column :cards, :attempt, :integer, default: 1, null: false
    add_column :cards, :quality, :integer, default: 5, null: false
  end
end
