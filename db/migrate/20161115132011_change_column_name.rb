class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    change_table :cards do |t|
      t.rename :riginal_text, :original_text
      end
  end
end
