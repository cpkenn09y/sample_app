class CreateProducts < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE weight_unit AS ENUM ('mg', 'lb');
    SQL
    create_table :products do |t|
      t.integer :weight_value
      t.integer :universal_weight_value
      t.timestamps
    end
    add_column :products, :weight_unit, :weight_unit
  end

  def down
    drop_table :products
    execute <<-SQL
      DROP TYPE weight_unit;
    SQL
  end
end
