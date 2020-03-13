class CreateProducts < ActiveRecord::Migration[5.2]
  def up
    create_table :products do |t|
      t.integer :weight_value
      t.integer :universal_weight_value

      t.timestamps
    end
    execute <<-SQL
      CREATE TYPE weight_unit_type AS ENUM ('mg', 'lb');
    SQL
    add_column :products, :weight_unit, :weight_unit_type
  end

  def down
    drop_table :products
    execute <<-SQL
      DROP TYPE weight_unit_type;
    SQL
  end
end
