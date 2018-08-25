class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :currency_name
      t.string :token

      t.timestamps
    end
  end
end
