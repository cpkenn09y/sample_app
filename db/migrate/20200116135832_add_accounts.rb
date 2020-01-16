class AddAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :email

      t.timestamps
    end
  end
end
