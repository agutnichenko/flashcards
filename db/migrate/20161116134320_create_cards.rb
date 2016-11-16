class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :original_text, nil: false
      t.string :translated_text, nil: false
      t.date :review_date
      t.timestamps
    end
  end
end
