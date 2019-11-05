class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nom
      t.boolean :is_admin
      t.references :region, foreign_key: true
      t.references :commune, foreign_key: true
      t.references :fokontany, foreign_key: true

      t.timestamps
    end
  end
end
