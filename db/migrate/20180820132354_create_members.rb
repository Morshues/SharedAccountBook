class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :book, index: true
      t.references :user, index: true
      t.string :nickname

      t.timestamps
    end
  end
end
