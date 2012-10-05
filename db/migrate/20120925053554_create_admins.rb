class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :role_id

      t.timestamps
    end
  end
end
