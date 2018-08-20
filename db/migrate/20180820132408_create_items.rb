class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :book, index: true
      t.string :title
      t.float :price, default: 0, null: false
      t.datetime :time
      t.references :exchange, index: true

      t.timestamps
    end
  end
end
