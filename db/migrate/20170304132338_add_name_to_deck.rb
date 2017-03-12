class AddNameToDeck < ActiveRecord::Migration[5.0]
  def change
    add_column :decks, :name, :string
  end
end
