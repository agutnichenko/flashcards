class DropCards < ActiveRecord::Migration[5.0]
  def change
    drop_table :cards
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
