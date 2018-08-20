class CreateFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :flows do |t|
      t.references :item, index: true
      t.references :member, index: true
      t.float :number, default: 0, null: false

      t.timestamps
    end
  end
end
