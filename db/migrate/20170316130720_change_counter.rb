class ChangeCounter < ActiveRecord::Migration[5.0]
  def change
    rename_column :cards, :counter, :counter_correct
  end
end
