class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :Original_text
      t.string :Translated_text
      t.float :Review_date
      t.timestamps
      #:created_at, :updated_at
    end
  end
end
