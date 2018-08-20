class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.references :book, index: true
      t.string :currency
      t.float :value

      t.timestamps
    end
  end
end
