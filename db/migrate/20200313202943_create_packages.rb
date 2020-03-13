class CreatePackages < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE inventory_actions AS ENUM ('bought', 'adjusted', 'sold', 're-bought');
    SQL
    create_table :packages do |t|
      t.integer :weight_value
      t.integer :universal_weight_value
      t.string :universal_weight_value
      t.references :products
      t.timestamps
    end
    add_column :packages, :weight_unit, :weight_unit
    add_column :packages, :last_action_taken, :inventory_actions
    add_index :packages, :last_action_taken
  end

  def down
    drop_table :packages
    execute <<-SQL
      DROP TYPE inventory_actions;
    SQL
  end
end
