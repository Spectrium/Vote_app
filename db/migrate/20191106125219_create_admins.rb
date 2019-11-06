class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password
      t.references :region, foreign_key: true
      t.references :commune, foreign_key: true
      t.references :fokontany, foreign_key: true

      t.timestamps
    end
  end
end
