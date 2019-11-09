class CreateRecensements < ActiveRecord::Migration[5.2]
  def change
    create_table :recensements do |t|
      t.string :full_name
      t.string :cin
      t.string :contact
      t.references :fokontany, foreign_key: true

      t.timestamps
    end
  end
end
