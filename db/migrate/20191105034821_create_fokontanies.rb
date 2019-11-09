class CreateFokontanies < ActiveRecord::Migration[5.2]
  def change
    create_table :fokontanies do |t|
      t.string :name
      t.references :commune, foreign_key: true

      t.timestamps
    end
  end
end
