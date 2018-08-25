class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.references :book, index: true
      t.references :user, index: true
      t.integer :permission_group, null: false, default: 1
      t.string :nickname

      t.timestamps
    end
  end
end
