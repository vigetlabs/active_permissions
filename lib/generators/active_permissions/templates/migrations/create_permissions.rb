class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :admin_user, null: false
      t.string     :model,      null: false
      t.string     :action,     null: false
      t.boolean    :allowed,    null: false, default: true

      t.timestamps null: false
    end

    add_index :permissions, :model
    add_index :permissions, :action
    add_index :permissions, :admin_user_id
    add_foreign_key :permissions, :admin_users, on_delete: :cascade
  end
end
